package com.example.demo;


import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MusicService {
	
	private ArrayList<Double> spaceUsed;
	
	

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	FileEntity fileEntity;
	
	public MusicService() {
		spaceUsed = new ArrayList<>();
	}

	public Double  getSpaceUsed() {
		
		Double space = 0.0;
		for(Double s:spaceUsed) {
			space = space + s;
		}
		
		return space;
	}
	public String[] getNameAndType(String fileName) {
		String strArray[] = fileName.split("\\.");
		int n = strArray.length;
		String arr[] = {"",""};
		if(n > 0) {
			for(int i = 0; i < n-1; i++) {
				if( i > 0) {
					arr[0] = arr[0]+"." +strArray[i];
				}
				else {
					arr[0] = arr[0]+ strArray[i];
				}
				
			}
			arr[1] = strArray[n-1];
		}
		
		return arr;
	}
	public List<String> uploadMutiFiles(HttpServletRequest servletRequest, Music music ) {
		int userId = getSession(servletRequest);
		List<MultipartFile> files = music.getSongs();
		List<String> errors = new ArrayList<>();
		double space = getSpaceUsed();
		for(MultipartFile f:files) {
			space = space + f.getSize()/(1024*1024);
			if(space > 500) {
				errors.add("File(s) exceed storage limit of 500 MB");
				return errors;
			}
		}
		if(files != null && files.size() > 0) {
			for(MultipartFile file:files) {
				String fullFileName = file.getOriginalFilename();
				long fileSize = file.getSize();
				String arr[] = getNameAndType(fullFileName);
				String fileName = arr[0]+userId;
				String fileType = arr[1];
				String destFileName = fileName+"."+fileType;
				
				
				File songFile = new File(System.getProperty("user.dir")+"/src/main/resources/static/music",destFileName);
				try {
					String val = validateFile(fileSize, fileType, fileName);
					if(val.equals("")) {
						if(checkDuplicatFiles(fileName, userId).size() > 0) {
							errors.add("Song already exists: "+destFileName);  
						}
						else {
								fileEntity.setFileId(0);
								fileEntity.setFileName(fileName);
								fileEntity.setFileType(fileType);
								fileEntity.setFileSize(fileSize);
								fileEntity.setPath(String.valueOf(songFile));
								fileEntity.setGetCategoryName(music.getCategoryName());
								fileEntity.setUserId(userId);
								file.transferTo(songFile);	
								insertSongs(servletRequest, fileEntity);
		
							
						}
						
					}
					else {
						errors.add(val);  
					}
					
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		return errors;
	}
	public int getSession(HttpServletRequest servletRequest) {
		String session = servletRequest.getSession().getAttribute("userID").toString();
		return Integer.valueOf(session);
	}
	

	// zip songs into a folder
	public void zipFolder(int userId, String catName) {
		
		
		
	}
	// move file to another category
	public void changeFileCategory(MoveFile moveFile) {
		String source = moveFile.getSourceFolder().toUpperCase();
		String song = moveFile.getSong();
		String dest = moveFile.getDestFolder().toUpperCase();
		
		Object obj[] = {dest,song,source};
		String sql = "UPDATE  song SET catName = ? WHERE songName = ? AND catName = ?";
		jdbcTemplate.update(sql, obj);
	}
	// get songs by userId 
	public Iterable<FileEntity> getFilesByUserId( int id){
		String sql = "SELECT * FROM song WHERE  userId = ?";
		spaceUsed.clear();
		DecimalFormat f = new DecimalFormat("#.##");
		
	      return jdbcTemplate.query(
	                sql,
	                new Object[] {id},
	                (rs,rowNum)->{
	                      FileEntity file = new FileEntity();
	                      file.setFileId(rs.getInt(1));
	                      file.setFileName(rs.getString(2));
	                      file.setFileType(rs.getString(3));
	                      file.setFileSize(Double.valueOf(f.format((double)rs.getInt(4)/(1024*1024))));
	                      file.setPath(rs.getString(5));
	                      file.setGetCategoryName(rs.getString(6));
	                      file.setUserId(rs.getInt(7));
	                      spaceUsed.add(Double.valueOf(f.format((double)rs.getInt(4)/(1024*1024))));
		                   return file;
		                               
	                }
	             );
	}
	
	// check duplicate uploads
	public List<Object> checkDuplicatFiles(String fileName,int id){
		Object [] obj = {fileName,id};

		String sql = "SELECT * FROM song WHERE songName = ? AND  userId = ?";
	      return jdbcTemplate.query(
	                sql,
	                obj,
	                (rs,rowNum)->{
	                     ArrayList<Object> names = new ArrayList<>();
	                     names.add(rs.getInt(1));
	                	return names;
		                               
	                }
	             );
	
	}
	// get songs by userId 
		public Iterable<FileEntity> getFilesByCatNameAndUserId( HttpServletRequest servletRequest,String catName){
			String sql = "SELECT * FROM song WHERE catName = ? AND  userId = ?";
			int id = getSession(servletRequest);
		      return jdbcTemplate.query(
		                sql,
		                new Object[] {catName,id},
		                (rs,rowNum)->{
		                      FileEntity file = new FileEntity();
		                      file.setFileId(rs.getInt(1));
		                      file.setFileName(rs.getString(2));
		                      file.setFileType(rs.getString(3));
		                      file.setFileSize(rs.getInt(4));
		                      file.setPath(rs.getString(5));
		                      file.setGetCategoryName(rs.getString(6));
		                      file.setUserId(rs.getInt(7));
			                   return file;
			                               
		                }
		             );
		}
	public void insertSongs(HttpServletRequest servletRequest,FileEntity file) {
		//songId	songName	songType	songSize	songDuration	songPath	catId	userId
		 String sql = "INSERT INTO song (songName, songType, songSize,songPath,catName,userId) " 
	               + "VALUES (?, ?, ?, ?,?,?)"; 
		 	Object [] obj = {
		 			file.getFileName(),
		 			file.getFileType(),
		 			file.getFileSize(),
		 			file.getPath(),
		 			file.getGetCategoryName(),
		 			file.getUserId()
		 			};
		    
	       jdbcTemplate.update(sql, obj);
	       
	}
	
	// file validation
	public String validateFile(long fileSize, String fileType,String fileName) {
		long maxSize = 50000000;
		
		if(fileType.toLowerCase().equals("mp3") || fileType.toLowerCase().equals("mp4") || fileType.toLowerCase().equals("m4a")) {
			if(fileSize < maxSize) {
				return "";
			}
			else {
				return "File size Error(should be less than 50MB): "+fileName;
			}
			
		}
		else {
			return "File type Error(only mp4 and mp3 are allowed): "+fileName;
		}
	}
	// save folder
	public void saveFolder(String folder,HttpServletRequest servletRequest) {
	     String sql = "INSERT INTO category (catName, catDate, catTime, userId) " 
               + "VALUES (?, ?, ?, ?)"; 
	     int id = getSession(servletRequest);
		String date = String.valueOf(LocalDate.now()); // 2020-12-18
		String time = String.valueOf(LocalTime.now()); // 11:31:16.768906700
		// demo
	    
       jdbcTemplate.update(sql, new Object[] { folder,date,time,id});
       
	}
	
	public Iterable<Folder> findFoldersByUserId(int id) {
		
		String sql = "SELECT * FROM category WHERE  userId = ?";
	      return jdbcTemplate.query(
	                sql,
	                new Object[] {id},
	                (rs,rowNum)->{
	                      Folder fldr = new Folder();
	                      fldr.setFolder(rs.getString(2));
		                   return fldr;
		                               
	                }
	             );
	}
	
	public List<Folder> findFolderByNameAndUserId(String folder,HttpServletRequest servletRequest) {
		
		String sql = "SELECT * FROM category WHERE catName = ? AND userId = ?";
		int id = getSession(servletRequest);
	      return jdbcTemplate.query(
	                sql,
	                new Object[] {folder,id},
	                (rs,rowNum)->{
	                      Folder fldr = new Folder();
	                      fldr.setFolder(rs.getString(2));
		                   return fldr;
		                               
	                }
	             );
	}
	
	public void deleteSong(int songId, int userId,String songName) {
		String sql = "DELETE FROM song WHERE songId = ? AND userId = ?";
		 jdbcTemplate.update(sql, new Object[] { songId,userId});
		 File songFile = new File(System.getProperty("user.dir")+"/src/main/resources/static/music",songName);
		 if(songFile.exists()) {
			 songFile.delete();
		 }
		 
	}
	public Iterable<People> getAllUsers() {
		String sql = "SELECT id,fname,lname,count(distinct catName) as Categories,count(songId) as songs FROM "
					+ "music.users join music.song where id = userId group by id";
	      return jdbcTemplate.query(
	                sql,
	                (rs,rowNum)->{
	                      People person = new People();
	                      person.setId(rs.getInt(1));
	                      person.setFname(rs.getString(2));
	                      person.setLname(rs.getString(3));
	                      person.setCategories(rs.getInt(4));
	                      person.setSongs(rs.getInt(5));
		                  return person;
		                               
	                }
	             );
	}
}
