package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class StudentPic{
    private Integer studentPicId;
    private String picPath;
    private Boolean mainPic;
    private Student student;

	public StudentPic(Student student , String picPath){
		this.student = student;
		this.picPath = picPath;
	}

	public StudentPic(Integer studentPicId,String picPath, Boolean mainPic,Student student){
		this.studentPicId = studentPicId;
		this.picPath = picPath;
		this.mainPic = mainPic;
		this.student = student;
	}

	public static void savePics(ArrayList<StudentPic> pics) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/applicationdb?user=root&password=1234");

			String query = "insert into studentpic (student_id, pic_path) value (?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			if(pics.size() > 0) {
				ps.setInt(1, pics.get(0).getStudent().getStudent_id());
				for(StudentPic pic : pics) {
					ps.setString(2, pic.getPicPath());

					ps.executeUpdate();
				}
			}               

			con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

	public Integer getStudentPicId() {
		return studentPicId;
	}

	public void setStudentPicId(Integer studentPicId) {
		this.studentPicId = studentPicId;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public Boolean getMainPic() {
		return mainPic;
	}

	public void setMainPic(Boolean mainPic) {
		this.mainPic = mainPic;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}



}