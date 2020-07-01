package com.coderby.myapp.hr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.coderby.myapp.hr.model.AssignVO;
import com.coderby.myapp.hr.model.EntVO;
import com.coderby.myapp.hr.model.LecVO;
import com.coderby.myapp.hr.model.MemberVO;

@Repository
public class MyappRepository implements IMyappRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;

	private class AssignMapper implements RowMapper<AssignVO> {
		@Override
		public AssignVO mapRow(ResultSet rs, int count) throws SQLException {
			AssignVO assign = new AssignVO();
			assign.setLec_id(rs.getInt("lec_id"));
			assign.setAsign_name(rs.getString("asign_name"));
			assign.setAsign_end(rs.getDate("asign_end"));
			return assign;
		}
	}

	private class EntMapper implements RowMapper<EntVO> {
		@Override
		public EntVO mapRow(ResultSet rs, int count) throws SQLException {
			EntVO ent = new EntVO();
			ent.setEnt_id(rs.getInt("ent_id"));
			ent.setEnt_name(rs.getString("ent_name"));
			ent.setPaper_end(rs.getDate("paper_end"));
			ent.setInterview1(rs.getDate("interview1"));
			ent.setInterview2(rs.getDate("interview2"));
			ent.setInterview3(rs.getDate("interview3"));
			return ent;
		}
	}

	private class LecMapper implements RowMapper<LecVO> {
		@Override
		public LecVO mapRow(ResultSet rs, int count) throws SQLException {
			LecVO lec = new LecVO();
			lec.setLec_id(rs.getInt("lec_id"));
			lec.setLec_name(rs.getString("lec_name"));
			lec.setLec_start(rs.getDate("lec_start"));
			lec.setLec_end(rs.getDate("lec_end"));
			return lec;
		}
	}

	private class MemMapper implements RowMapper<MemberVO> {
		@Override
		public MemberVO mapRow(ResultSet rs, int count) throws SQLException {
			MemberVO mem = new MemberVO();
			mem.setMem_id(rs.getString("mem_id"));
			mem.setMem_name(rs.getString("mem_name"));
			mem.setMem_pw(rs.getString("mem_pw"));
			return mem;
		}
	}
	
	@Override
	public int getEntCount() {
		String sql = "select count(*) from enterprise";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public int getLecCount() {
		String sql = "select count(*) from lecture";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public List<Map<String, Object>> getListLec() {
		String sql = "select lec_id, lec_name, lec_start, lec_end from lecture";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public List<Map<String, Object>> getListEnt() {
		return jdbcTemplate.queryForList("select * from enterprise");
	}

	/*
	 * @Override public List<Map<String, Object>> getListAssign1(int lec_id, int
	 * seq_id) { return jdbcTemplate.
	 * queryForList("select * from assignment where lec_id = ? and seq_id=?",
	 * lec_id,seq_id);
	 * 
	 * return jdbcTemplate.query(sql, lec_id, new RowMapper<AssignVO>() {
	 * 
	 * @Override public AssignVO mapRow(ResultSet rs, int count) throws SQLException
	 * { AssignVO assign = new AssignVO(); assign.setLec_id(rs.getInt("lec_id"));
	 * assign.setAsign_name(rs.getString("asign_name"));
	 * assign.setAsign_end(rs.getDate("asign_end")); return assign; } });
	 * 
	 * }
	 */
	@Override
	public void updateEnt(EntVO ent) {
		jdbcTemplate.update(
				"update enterprise set ent_name=?,paper_end=?, interview1=?, interview2=?, interview3=? where ent_id = ? and seq_id =?",
				ent.getEnt_name(), ent.getPaper_end(), ent.getInterview1(), ent.getInterview2(), ent.getInterview3(),
				ent.getEnt_id(),ent.getSeq_id());
	}

	@Override
	public void updateLec(LecVO lec) {
		jdbcTemplate.update("update lecture set lec_name=?,lec_start=?, lec_end=? where lec_id = ? and seq_id=?", lec.getLec_name(),
				lec.getLec_start(), lec.getLec_end(), lec.getLec_id(),lec.getSeq_id());
	}

	@Override
	public void updateAssign(AssignVO asign) {
		jdbcTemplate.update("update assignment set asign_end=?,asign_name=? where lec_id = ?", asign.getAsign_end(),
				asign.getAsign_name(), asign.getLec_id());

	}

	@Override
	public void insertEnt(EntVO ent) {
		jdbcTemplate.update("insert into enterprise values(ent_id.NEXTVAL,?,?,?,?,?,?)", ent.getEnt_name(),
				ent.getPaper_end(), ent.getInterview1(), ent.getInterview2(), ent.getInterview3(), ent.getSeq_id());

	}

	@Override
	public void insertLec(LecVO lec) {
		jdbcTemplate.update("insert into lecture values(lec_id.NEXTVAL,?,?,?,?)", lec.getLec_name(), lec.getLec_start(),
				lec.getLec_end(),lec.getSeq_id());
	}

	@Override
	public void insertAssign(AssignVO asign) {
		jdbcTemplate.update("insert into assignment values(?,?,?)", asign.getLec_id(), asign.getAsign_end(),
				asign.getAsign_name());
	}

	/*
	 * @Override public void deleteEnt(int ent_id) {
	 * jdbcTemplate.update("delete from enterprise where ent_id = ?", ent_id);
	 * 
	 * }
	 * 
	 * @Override public void deleteLec(int lec_id) {
	 * jdbcTemplate.update("delete from lecture where lec_id = ?", lec_id);
	 * 
	 * }
	 */

	@Override
	public void deleteAssign(int lec_id, String asign_name) {
		jdbcTemplate.update("delete from assignment where lec_id = ? and asign_name = ?", lec_id, asign_name);

	}

	/*
	 * @Override public List<Map<String, Object>> getListLec(int lec_id) { return
	 * jdbcTemplate.queryForList("select * from lecture where lec_id = ?", lec_id);
	 * 
	 * }
	 */
	@Override
	public List<Map<String, Object>> getListAssign() {
		return jdbcTemplate.queryForList("select * from assignment");

	}

	@Override
	public AssignVO getAssignInfo(int lec_id) {
		String sql = "select * from assignment where lec_id =?";
		return jdbcTemplate.queryForObject(sql, new AssignMapper(), lec_id);
	}

	/*
	 * @Override public EntVO getEntInfo(int ent_id) { String sql =
	 * "select * from enterprise where ent_id =?"; return
	 * jdbcTemplate.queryForObject(sql, new EntMapper(), ent_id); }
	 * 
	 * @Override public LecVO getLecInfo(int lec_id) { String sql =
	 * "select * from lecture where lec_id =?"; return
	 * jdbcTemplate.queryForObject(sql, new LecMapper(), lec_id); }
	 */

	@Override
	public AssignVO getAssignInfo(int lec_id, String asign_name) {
		String sql = "select * from assignment where lec_id =? and asign_name=?";
		return jdbcTemplate.queryForObject(sql, new AssignMapper(), lec_id, asign_name);
	}

	@Override
	public List<Map<String, Object>> getListLec(int lec_id, int seq_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getListAssign(int lec_id, int seq_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getListMember() {
		return jdbcTemplate.queryForList("select * from member");
	}

	@Override
	public EntVO getEntInfo(int ent_id, int seq_id) {
		String sql = "select * from enterprise where ent_id=? and seq_id =?";
		return jdbcTemplate.queryForObject(sql, new EntMapper(),ent_id, seq_id);
	}

	@Override
	public LecVO getLecInfo(int lec_id, int seq_id) {
		String sql = "select * from lecture where lec_id=? and seq_id =?";
		return jdbcTemplate.queryForObject(sql, new LecMapper(),lec_id, seq_id);
	}

	@Override
	public MemberVO getMemberInfo(int seq_id) {
		String sql = "select * from member where seq_id =?";
		return jdbcTemplate.queryForObject(sql, new MemMapper(),seq_id);
	}

	@Override
	public MemberVO getMemberInfo(String mem_pw) {
		String sql = "select * from member where mem_pw =?";
		return jdbcTemplate.queryForObject(sql, new MemMapper(), mem_pw);
	}

	@Override
	public void updateMember(MemberVO mem) {
		jdbcTemplate.update("update member set mem_id=?, mem_pw=?, mem_name=? "
				+ "where mem_id=? and mem_pw=?", 
				mem.getMem_id(), mem.getMem_pw(), mem.getMem_name(),
				mem.getMem_id(), mem.getMem_pw());
	}

	@Override
	public void insertMember(MemberVO mem) {
		
		jdbcTemplate.update("insert into member values(seq_id.NEXTVAL,?,?,?)", mem.getMem_id(), mem.getMem_pw(), mem.getMem_name());
	}

	@Override
	public void deleteEnt(int ent_id, int seq_id) {
		jdbcTemplate.update("delete from enterprise where ent_id=? and seq_id =?", ent_id, seq_id);
	}

	@Override
	public void deleteLec(int lec_id, int seq_id) {
		jdbcTemplate.update("delete from lecture where lec_id=? and seq_id =?", lec_id, seq_id);

	}

	@Override
	public void deleteMember(String mem_id, String mem_pw) {
		jdbcTemplate.update("delete from member where mem_id=? and mem_pw =?", mem_id, mem_pw);

	}

	@Override
	public List<Map<String, Object>> getListMember(int seq_id) {
		return jdbcTemplate.queryForList("select * from member where seq_id=?",seq_id);
	}

	@Override
	public List<Map<String, Object>> getListMember(String mem_id, String mem_pw) {
		return jdbcTemplate.queryForList("select * from member where mem_id =? and mem_pw=?",mem_id, mem_pw);
	}

	@Override
	public MemberVO getMemberInfo(String mem_id, String mem_pw) {
		String sql = "select * from member where mem_id=? and mem_pw =?";
		return jdbcTemplate.queryForObject(sql, new MemMapper(),mem_id, mem_pw);
	}

	@Override
	public int getSeqFromEnt(int ent_id) {
		String sql = "select seq_id from enterprise where ent_id =?";
		return jdbcTemplate.queryForObject(sql,Integer.class,ent_id);
	}

	@Override
	public int getSeqFromLec(int lec_id) {
		String sql = "select seq_id from lecture where lec_id =?";
		return jdbcTemplate.queryForObject(sql,Integer.class, lec_id);
	}

}
