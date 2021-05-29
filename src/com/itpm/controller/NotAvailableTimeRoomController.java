/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import com.itpm.core.CommonConstants;
import com.itpm.dao.impl.NotAvailableTimeRoomsImpl;
import com.itpm.model.NotAvailableTimesOfRoom;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author asus
 */
public class NotAvailableTimeRoomController {

    // room_name, day, start_time, end-time, detail
    public static boolean addRecord(String roomName, String day, String startTime, String endTime, String detail) throws SQLException {
        NotAvailableTimesOfRoom availableTimesOfRoom = new NotAvailableTimesOfRoom();
        availableTimesOfRoom.setRoomName(roomName);
        availableTimesOfRoom.setDay(day);
        availableTimesOfRoom.setStartTime(startTime);
        availableTimesOfRoom.setEndTime(endTime);
        availableTimesOfRoom.setDetail(detail);
        return new NotAvailableTimeRoomsImpl().addNotAvailableTimeRoom(availableTimesOfRoom);
    }

    public static boolean updateRecord(String roomName, String day, String startTime, String endTime, String detail, int id) throws SQLException {
        NotAvailableTimesOfRoom availableTimesOfRoom = new NotAvailableTimesOfRoom();
        availableTimesOfRoom.setRoomName(roomName);
        availableTimesOfRoom.setDay(day);
        availableTimesOfRoom.setStartTime(startTime);
        availableTimesOfRoom.setEndTime(endTime);
        availableTimesOfRoom.setDetail(detail);
        availableTimesOfRoom.setId(id);
        return new NotAvailableTimeRoomsImpl().updateNotAvailableTimeRoom(availableTimesOfRoom);
    }

    public static boolean deleteRecord(int id) throws SQLException {
        return new NotAvailableTimeRoomsImpl().deleteNotAvailableTimeRoom(id);
    }

    public static ResultSet getAll() throws SQLException {
        return new NotAvailableTimeRoomsImpl().getAllNotAvailableTimes();
    }

    public static ResultSet getOneByAttribute(String attribute, String condition, String value) throws SQLException {
        return new NotAvailableTimeRoomsImpl().getRecordByOneAttribute(attribute, condition, value);
    }

    public static NotAvailableTimesOfRoom getObjectById(int id) throws SQLException {
        NotAvailableTimesOfRoom availableTimesOfRoom = null;
        ResultSet rset = getOneByAttribute("id", CommonConstants.sql.EQUAL, Integer.toString(id));
        while (rset.next()) {
            availableTimesOfRoom = new NotAvailableTimesOfRoom();
            availableTimesOfRoom.setId(rset.getInt("id"));
            availableTimesOfRoom.setStartTime(rset.getString("start_time"));
            availableTimesOfRoom.setRoomName(rset.getString("room_name"));
            availableTimesOfRoom.setDay(rset.getString("day"));
            availableTimesOfRoom.setEndTime(rset.getString("end_time"));
            availableTimesOfRoom.setDetail(rset.getString("detail"));
        }
        return availableTimesOfRoom;
    }

}
