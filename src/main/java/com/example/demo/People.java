package com.example.demo;

//SELECT id,lname,fname,count(distinct catName) as Categories,
//count(songId) as songs FROM music.users join music.song where id = userId
public class People {

	private int id;
	private String fname;
	private String lname;
	private int Categories;
	private int songs;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getCategories() {
		return Categories;
	}
	public void setCategories(int categories) {
		Categories = categories;
	}
	public int getSongs() {
		return songs;
	}
	public void setSongs(int songs) {
		this.songs = songs;
	}
	
	
	
}
