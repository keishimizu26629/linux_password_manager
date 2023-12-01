echo パスワードマネージャーへようこそ！

while true; do

  echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit): "
  read answer

  if [ "$answer" = "Add Password" ]
  then
    echo -n サービス名を入力してください：
    read service_name

    echo -n ユーザー名を入力してください：
    read user_name

    echo -n パスワードを入力してください：
    read password

    echo "$service_name:$user_name:$password" >> password_manager.txt

  elif [ "$answer" = "Get Password" ]
  then
    echo -n サービス名を入力してください：
    read service_name

    matched_user=$(grep "^$service_name:" password_manager.txt)

    if [ -n "$matched_user" ]
    then
      IFS=':' read -r matched_service_name matched_user_name matched_password <<< "$matched_user"

      echo "サービス名: $matched_service_name"
      echo "ユーザー名: $matched_user_name"
      echo "パスワード: $matched_password"
    else
      echo "そのサービス名の情報は見つかりませんでした。"
    fi

  elif [ "$answer" = "Exit" ]
  then
    echo Thank you!
    break
  else
    echo 入力が間違えています。Add Password/Get Password/Exit から入力してください。
  fi
done
