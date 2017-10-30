class LmController < ApplicationController
  def hello
    myJson = {"result" => TRUE, "message" => "Hello!"}
    render json: myJson
  end

  def sign_up
    u = User.new
    u.user_id = params[:user_id]
    u.password = params[:password]
    u.name = params[:name]
    u.gender = params[:gender]
    u.save

    myJson = {"result" => TRUE, "message" => "사용자 회원가입"}
    render json: myJson
  end

  def sign_in
    if User.where(user_id: params[:user_id], password: params[:password]).exists?

      u = User.where(user_id: params[:user_id], password: params[:password]).first

      myJson = {"result" => TRUE, "message" => "로그인 성공", "user" => u}
      render json: myJson
    else
      myJson = {"result" => FALSE, "message" => "로그인 실패"}
      render json: myJson
    end
  end
end
