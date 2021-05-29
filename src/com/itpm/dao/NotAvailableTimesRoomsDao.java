/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.dao;

import com.itpm.model.NotAvailableTimesOfRoom;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author asus
 */
public interface NotAvailableTimesRoomsDao {

    boolean addNotAvailableTimeRoom(NotAvailableTimesOfRoom availableTimesOfRoom) throws SQLException;

    boolean updateNotAvailableTimeRoom(NotAvailableTimesOfRoom availableTimesOfRoom) throws SQLException;

    boolean deleteNotAvailableTimeRoom(int id) throws SQLException;

    ResultSet getAllNotAvailableTimes() throws SQLException;

    ResultSet getRecordByOneAttribute(String attribute, String condition, String value) throws SQLException;

}
