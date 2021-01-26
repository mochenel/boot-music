package com.example.demo;

import org.springframework.stereotype.Component;

@Component
public class Folder {

	private String folder;

	
	public Folder() {
		super();
		this.folder = "";
	}

	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}
	
	
}
