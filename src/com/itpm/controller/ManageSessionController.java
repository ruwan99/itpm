/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import com.itpm.core.CommonConstants;
import com.itpm.dao.impl.ManageSessionRoomDaoImpl;
import com.itpm.model.ManageSessionRoom;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HIRUSHA DHANUPRIYA
 */
public class ManageSessionController {

    public static boolean addRecord(String lecturerName, String subject, String tag, String room) throws SQLException {
        ManageSessionRoom manageSessionRoom = new ManageSessionRoom();
        manageSessionRoom.setSujectName(subject);
        manageSessionRoom.setRoomName(room);
        manageSessionRoom.setTagName(tag);
        manageSessionRoom.setLecturerName(lecturerName);
        return new ManageSessionRoomDaoImpl().addSessionRoom(manageSessionRoom);
    }

    public static boolean updateRecord(String lecturerName, String subject, String tag, String room, int id) throws SQLException {
        ManageSessionRoom manageSessionRoom = new ManageSessionRoom();
        manageSessionRoom.setSujectName(subject);
        manageSessionRoom.setRoomName(room);
        manageSessionRoom.setTagName(tag);
        manageSessionRoom.setLecturerName(lecturerName);
        manageSessionRoom.setId(id);
        return new ManageSessionRoomDaoImpl().updateSessionRoom(manageSessionRoom);
    }

    public static boolean deleteRecord(int id) throws SQLException {
        return new ManageSessionRoomDaoImpl().deleteSessionRoom(id);
    }

    public static ResultSet getAllData() throws SQLException {
        return new ManageSessionRoomDaoImpl().getAllSessionRoom();
    }

    public static ManageSessionRoom getObjectById(int id) throws SQLException {
        ResultSet rset = new ManageSessionRoomDaoImpl().getResultByOneAttribute("id", CommonConstants.sql.EQUAL, Integer.toString(id));
        ManageSessionRoom manageSessionRoom = null;
        while (rset.next()) {
            manageSessionRoom = new ManageSessionRoom();
            manageSessionRoom.setId(rset.getInt("id"));
            manageSessionRoom.setLecturerName(rset.getString("lecturer_name"));
            manageSessionRoom.setSujectName(rset.getString("subject_name"));
            manageSessionRoom.setTagName(rset.getString("tag_name"));
            manageSessionRoom.setRoomName(rset.getString("room_name"));
        }
        return manageSessionRoom;
    }
}
