/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.dao.impl;

import com.itpm.connection.DatabaseConnection;
import com.itpm.dao.ManageSessionRoomDao;
import com.itpm.model.ManageSessionRoom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HIRUSHA DHANUPRIYA
 */
public class ManageSessionRoomDaoImpl implements ManageSessionRoomDao {

    private String selectQuery = "select id, lecturer_name, subject_name, tag_name, room_name, detail_1, detail_2, status from manage_session_rooms";

    @Override
    public boolean addSessionRoom(ManageSessionRoom manageSessionRoom) throws SQLException {
        Connection con = DatabaseConnection.getDatabaseConnection();
        PreparedStatement ps = con.prepareStatement("insert into manage_session_rooms(lecturer_name, subject_name, tag_name, room_name, detail_1, detail_2, status) values (?,?,?,?,?,?,?)");
        ps.setString(1, manageSessionRoom.getLecturerName());
        ps.setString(2, manageSessionRoom.getSujectName());
        ps.setString(3, manageSessionRoom.getTagName());
        ps.setString(4, manageSessionRoom.getRoomName());
        ps.setString(5, manageSessionRoom.getDetail_1());
        ps.setString(6, manageSessionRoom.getDetail_2());
        ps.setString(7, manageSessionRoom.getSujectName());
        ps.executeUpdate();
        ps.close();
        return true;
    }

    @Override
    public boolean updateSessionRoom(ManageSessionRoom manageSessionRoom) throws SQLException {
        Connection con = DatabaseConnection.getDatabaseConnection();
        PreparedStatement ps = con.prepareStatement("update manage_session_rooms set  lecturer_name=?, subject_name=?, tag_name=?, room_name=? where id=?");
        ps.setString(1, manageSessionRoom.getLecturerName());
        ps.setString(2, manageSessionRoom.getSujectName());
        ps.setString(3, manageSessionRoom.getTagName());
        ps.setString(4, manageSessionRoom.getRoomName());
        ps.setInt(5, manageSessionRoom.getId());
        ps.executeUpdate();
        ps.close();
        return true;

    }

    @Override
    public boolean deleteSessionRoom(int id) throws SQLException {
        Connection con = DatabaseConnection.getDatabaseConnection();
        PreparedStatement ps = con.prepareStatement("delete from manage_session_rooms where id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
        return true;
    }

    @Override
    public ResultSet getAllSessionRoom() throws SQLException {
        return new CommonDaoImpl().getAllRecords(selectQuery);
    }

    @Override
    public ResultSet getResultByOneAttribute(String attribute, String condition, String value) throws SQLException {
        return new CommonDaoImpl().getResultByAttribute(selectQuery, attribute, condition, value);
    }

}
