/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.dao;

import com.itpm.model.ManageSessionRoom;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HIRUSHA DHANUPRIYA
 */
public interface ManageSessionRoomDao {

    boolean addSessionRoom(ManageSessionRoom manageSessionRoom) throws SQLException;

    boolean updateSessionRoom(ManageSessionRoom manageSessionRoom) throws SQLException;

    boolean deleteSessionRoom(int id) throws SQLException;

    ResultSet getAllSessionRoom() throws SQLException;

    ResultSet getResultByOneAttribute(String attribute, String condition, String value) throws SQLException;

}
