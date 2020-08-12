public ArrayList<Cboard> selectList(Connection conn, int currentPage, int limit, String local, String search, String keyword) {
      ArrayList<Cboard> list = new ArrayList<Cboard>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String query = "select * "
               + "from (select rownum rnum, cboard_no, member_id, cboard_title, "
               + "cboard_content, cboard_date, cboard_lastmodified, cboard_viewcount, "
               + "cboard_replycount, cboard_likecount, cboard_reportcount, cboard_display, "
               + "local_no, cfiles_original_filepath1, cfiles_rename_filepath1, "
               + "cfiles_original_filepath2, cfiles_rename_filepath2, "
               + "cfiles_original_filepath3, cfiles_rename_filepath3, "
               + "cfiles_original_filepath4, cfiles_rename_filepath4 "
               + "from (select * from cboard "
               + (local != null && !local.equals("0") ? "where local_no = ? " : "");
      if (local != null && !local.equals("0")) {
         query += (search != null && search.equals("title") ? "and cboard_title like ? " : "");
         query += (search != null && search.equals("content") ? "and cboard_content like ? " : "");
         query += (search != null && search.equals("writer") ? "and member_id like ? " : "");
      } else {
         query += (search != null && search.equals("title") ? "where cboard_title like ? " : "");
         query += (search != null && search.equals("content") ? "where cboard_content like ? " : "");
         query += (search != null && search.equals("writer") ? "where member_id like ? " : "");
      }
      
      query += "order by cboard_no desc)) where rnum >= ? and rnum <= ?";
      
      
      int startRow = (currentPage - 1) * limit + 1;
      int endRow = startRow + limit - 1;
      
      try {
         int pstmtnum = 1;
         pstmt = conn.prepareStatement(query);
         if (local != null && !local.equals("0")) {
            pstmt.setString(pstmtnum++, local);
         }
         if ((search != null && search.equals("")) || (search != null && search.equals("title"))
               || (search != null && search.equals("content")) || (search != null &&search.equals("writer"))) {
            pstmt.setString(pstmtnum++, "%" + keyword + "%");
         }
         pstmt.setInt(pstmtnum++, startRow);
         pstmt.setInt(pstmtnum++, endRow);
         
         rset = pstmt.executeQuery();
         
         while (rset.next()) {
            Cboard cboard = new Cboard();
            
            cboard.setCboardNo(rset.getInt("cboard_no"));
            cboard.setMemberId(rset.getString("member_id"));
            cboard.setCboardTitle(rset.getString("cboard_title"));
            cboard.setCboardContent(rset.getString("cboard_content"));
            cboard.setDate(rset.getDate("cboard_date"));
            cboard.setLastmodifiedDate(rset.getDate("cboard_lastmodified"));
            cboard.setCboardViewCount(rset.getInt("cboard_viewcount"));
            cboard.setReplyCount(rset.getInt("cboard_replycount"));
            cboard.setLikeCount(rset.getInt("cboard_likecount"));
            cboard.setReportCount(rset.getInt("cboard_reportcount"));
            cboard.setCboardDisplay(rset.getString("cboard_display"));
            cboard.setLocalNo(rset.getString("local_no"));
            cboard.setCfilesOriginalFilepath1(rset.getString("cfiles_original_filepath1"));
            cboard.setCfilesRenameFilepath1(rset.getString("cfiles_rename_filepath1"));
            cboard.setCfilesOriginalFilepath2(rset.getString("cfiles_original_filepath2"));
            cboard.setCfilesRenameFilepath2(rset.getString("cfiles_rename_filepath2"));
            cboard.setCfilesOriginalFilepath3(rset.getString("cfiles_original_filepath3"));
            cboard.setCfilesRenameFilepath3(rset.getString("cfiles_rename_filepath3"));
            cboard.setCfilesOriginalFilepath4(rset.getString("cfiles_original_filepath4"));
            cboard.setCfilesRenameFilepath4(rset.getString("cfiles_rename_filepath4"));
            
            list.add(cboard);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }