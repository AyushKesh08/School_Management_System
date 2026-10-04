package models;

import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public class User{
    private Integer userId;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String userType;

    public User(String name,String email,String phone,String password,String userType){
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.userType = userType;
    }

	public User(String email,String password){
		this.email = email;
		this.password = password;
	}

	public boolean signinUser(){
		boolean flag = false;

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/applicationdb?user=root&password=1234");

			// System.out.println(email = email.trim());
			// System.out.println(email = password.trim());

			String query = "select * from users where email=? and password=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1 , email);
			ps.setString(2 , password);
			System.out.println(ps);

			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				userId = rs.getInt("user_id");
				name = rs.getString("name");
				phone = rs.getString("phone");
				userType = rs.getString("user_type");
				
				flag = true;
			}

			con.close();

		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}

		return flag;
	}

    public boolean saveUser(){
        boolean flag = false;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/applicationdb?user=root&password=1234");

            String query = "insert into users (name,email,password,phone,user_type) value (?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1 , name);
            ps.setString(2 , email);
            ps.setString(3 , password);
            ps.setString(4 , phone);
            ps.setString(5 , userType);

            int val = ps.executeUpdate();

            if(val == 1)
                flag = true;

        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return flag;
    }

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
}