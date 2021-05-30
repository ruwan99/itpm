/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.model;

/**
 *
 * @author HIRUSHA DHANUPRIYA
 */
public class ManageSessionRoom {
    
    //id, lecturer_name, subject_name, tag_name, room_name, detail_1, detail_2, status
    private int id;
    private String lecturerName;
    private String sujectName;
    private String tagName;
    private String roomName;
    private String detail_1;
    private String detail_2;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the lecturerName
     */
    public String getLecturerName() {
        return lecturerName;
    }

    /**
     * @param lecturerName the lecturerName to set
     */
    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }

    /**
     * @return the sujectName
     */
    public String getSujectName() {
        return sujectName;
    }

    /**
     * @param sujectName the sujectName to set
     */
    public void setSujectName(String sujectName) {
        this.sujectName = sujectName;
    }

    /**
     * @return the tagName
     */
    public String getTagName() {
        return tagName;
    }

    /**
     * @param tagName the tagName to set
     */
    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    /**
     * @return the roomName
     */
    public String getRoomName() {
        return roomName;
    }

    /**
     * @param roomName the roomName to set
     */
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    /**
     * @return the detail_1
     */
    public String getDetail_1() {
        return detail_1;
    }

    /**
     * @param detail_1 the detail_1 to set
     */
    public void setDetail_1(String detail_1) {
        this.detail_1 = detail_1;
    }

    /**
     * @return the detail_2
     */
    public String getDetail_2() {
        return detail_2;
    }

    /**
     * @param detail_2 the detail_2 to set
     */
    public void setDetail_2(String detail_2) {
        this.detail_2 = detail_2;
    }
    
    
    
}
