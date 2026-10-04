package models;

import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Student{
    private Integer student_id;
    private String name;
    private String fname;
    private String mname;
    private String age;
    private String email;
    private String phone;
    private User user;
	private ArrayList<StudentPic> pics;

	public Student(){
		super();
	}

	public Student(Integer student_id){
		super();
		this.student_id = student_id;
	}

    public Student(String name,String fname,String mname,String age,String email,String phone,User user){
        this.name = name;
        this.fname = fname;
        this.mname = mname;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.user = user;
    }

    public Student(String name,String fname,String mname,String email,String age,String phone,Integer student_id){
        this.name = name;
        this.fname = fname;
        this.mname = mname;
        this.email = email;
        this.age = age;
        this.phone = phone;
		this.student_id = student_id;
    }

	public boolean updateStudent(){
		boolean flag = false;

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/applicationdb?user=root&password=1234");

			String query = "update students set name=?,fath_name=?,moth_name=?,email=?,age=?,phone=? where student_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1 , name);
			ps.setString(2 , fname);
			ps.setString(3 , mname);
			ps.setString(4 , email);
			ps.setString(5 , age);
			ps.setString(6 , phone);
			ps.setInt(7 , student_id);

			int val = ps.executeUpdate();

			if(val == 1)
				flag = true;

		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}

		return false;
	}

	public boolean deleteStudent(){
		boolean flag = false;

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/applicationdb?user=root&password=1234");

			String query1 = "delete from studentpic where student_id=?";
			String query = "delete from students where student_id=?";

			PreparedStatement ps1 = con.prepareStatement(query1);
			PreparedStatement ps = con.prepareStatement(query);

			ps1.setInt(1 , student_id);
			ps.setInt(1 , student_id);

			int val1 = ps1.executeUpdate();
			int val = ps.executeUpdate();

			if(val == 1)
				flag = true;

		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}

		return flag;
	}

	public static ArrayList<Student> showAllStudents(User user){
		ArrayList<Student> students = new ArrayList<>();

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/applicationdb?user=root&password=1234");

			// String query = "select * from students";
			String query = "select * from students where user_id=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1 , user.getUserId());

			ResultSet rs = ps.executeQuery();

			String query2 = "select * from studentpic where student_id=?";
			PreparedStatement ps2 = con.prepareStatement(query2);

			while(rs.next()){
				Student student = new Student();
				int studentId = rs.getInt("student_id");
				student.student_id = studentId; 
				student.name = rs.getString("name");
				student.fname = rs.getString("fath_name");
				student.mname = rs.getString("moth_name");
				student.age = rs.getString("age");
				student.email = rs.getString("email");
				student.phone = rs.getString("phone");
				student.user = user;

				student.pics = new ArrayList<>();
				ps2.setInt(1 , studentId);

				ResultSet rs2 = ps2.executeQuery();

				while(rs2.next()){
					StudentPic pic = new StudentPic(rs2.getInt("student_pic_id"),rs2.getString("pic_path"), rs2.getBoolean("main_pic"), student);
					student.pics.add(pic);
				}

				students.add(student);
			}

			con.close();

		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}

		return students;
	}

    public boolean saveStudent(){
        boolean flag = false;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/applicationdb?user=root&password=1234");

            String query = "insert into students (name,fath_name,moth_name,age,email,phone,user_id) value (?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query , Statement.RETURN_GENERATED_KEYS);

            ps.setString(1 , name);
            ps.setString(2 , fname);
            ps.setString(3 , mname);
            ps.setString(4 , age);
            ps.setString(5 , email);
            ps.setString(6 , phone);
            ps.setInt(7 , user.getUserId());

            int val = ps.executeUpdate();

            if(val == 1){
                flag = true;
				ResultSet rs = ps.getGeneratedKeys();
				if(rs.next()){
					student_id = rs.getInt(1);
				}
			}

        }catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }

        return flag;
    }

	public Integer getStudent_id() {
		return student_id;
	}

	public void setStudent_id(Integer student_id) {
		this.student_id = student_id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getAge() {
		return this.age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

    public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ArrayList<StudentPic> getPics() {
		return pics;
	}

	public void setPics(ArrayList<StudentPic> pics) {
		this.pics = pics;
	}

}