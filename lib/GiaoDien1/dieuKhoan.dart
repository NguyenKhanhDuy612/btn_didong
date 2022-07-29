import 'package:flutter/material.dart';

class DieuKhoan extends StatelessWidget {
  const DieuKhoan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Text("1.Không được có những từ ngữ gay gắt, đả kích, xúc phạm, bêu xấu cá nhân và tổ chức trên WebTruyen."
                "2. Không phát tán và truyền bá thông tin bất hợp pháp, lừa gạt, bôi nhọ, sỉ nhục, tục tĩu, khiêu dâm, xúc phạm, đe dọa, lăng mạ, thù hận, kích động… hoặc trái với chuẩn mực đạo đức chung của xã hội."
                "3.Không được gửi hoặc truyền bất kỳ thông tin hoặc phần mềm nào có chứa bất kỳ loại virus, trojan, bọ hay các thành phần nguy hại nào đến sự an toàn của hệ thống dịch vụ."
                "4.Không được dẫn link hoặc nhắc đến website khác."
                "5.Không spam tin nhắn, bình luận, bài viết hay bất cứ hình thức nào tại WebTruyen."
                "6.Đánh giá và bình luận phải sử dụng tiếng việt có dấu."
                "7.Đánh giá hoặc bình luận không liên quan tới truyện sẽ bị xóa."
                "8.Đánh giá khen/chê truyện một cách chung chung không mang lại giá trị cho người đọc sẽ bị xóa."
                "9.Đánh giá có điểm số sai lệch với nội dung sẽ bị xóa"),
          ],
        ),
      ),
    );
  }
}
