/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.dao.impl;

import com.itpm.connection.DatabaseConnection;
import com.itpm.dao.NotAvailableTimesRoomsDao;
import com.itpm.model.NotAvailableTimesOfRoom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author asus
 */
public class NotAvailableTimeRoomsImpl implements NotAvailableTimesRoomsDao {

    private String selectQuery = "select id, room_name, day, start_time, end_time, detail from not_available_times_rooms";

    @Override
    public boolean addNotAvailableTimeRoom(NotAvailableTimesOfRoom availableTimesOfRoom) throws SQLException {
        Connection con = DatabaseConnection.getDatabaseConnection();
        PreparedStatement ps = con.prepareStatement("insert into not_available_times_rooms(room_name, day, start_time, end_time, detail) values (?,?,?,?,?)");
        ps.setString(1, availableTimesOfRoom.getRoomName());
        ps.setString(2, availableTimesOfRoom.getDay());
        ps.setString(3, availableTimesOfRoom.getStartTime());
        ps.setString(4, availableTimesOfRoom.getEndTime());
        ps.setString(5, availableTimesOfRoom.getDetail());
        ps.executeUpdate();
        ps.close();
        return true;
    }

    @Override
    public boolean updateNotAvailableTimeRoom(NotAvailableTimesOfRoom availableTimesOfRoom) throws SQLException {
        Connection con = DatabaseConnection.getDatabaseConnection();
        PreparedStatement ps = con.prepareStatement("update not_available_times_rooms set room_name=?, day=?, start_time=?, end_time=?, detail=? where id=?");
        ps.setString(1, availableTimesOfRoom.getRoomName());
        ps.setString(2, availableTimesOfRoom.getDay());
        ps.setString(3, availableTimesOfRoom.getStartTime());
        ps.setString(4, availableTimesOfRoom.getEndTime());
        ps.setString(5, availableTimesOfRoom.getDetail());
        ps.setInt(6, availableTimesOfRoom.getId());
        ps.executeUpdate();
        ps.close();
        return true;
    }

    @Override
    public boolean deleteNotAvailableTimeRoom(int id) throws SQLException {
        Connection con = DatabaseConnection.getDatabaseConnection();
        PreparedStatement ps = con.prepareStatement("delete from not_available_times_rooms where id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
        return true;
    }

    @Override
    public ResultSet getAllNotAvailableTimes() throws SQLException {
        return new CommonDaoImpl().getAllRecords(selectQuery);
    }

    @Override
    public ResultSet getRecordByOneAttribute(String attribute, String condition, String value) throws SQLException {
        return new CommonDaoImpl().getResultByAttribute(selectQuery, attribute, condition, value);
    }

}
