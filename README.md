# Gửi Bảo Ngọc — Sinh nhật tuổi 20

Một trang web quà sinh nhật, 5 chương, chạy hoàn toàn bằng một file `index.html`.

## Chạy thử ở máy

Đừng bấm đúp vào `index.html`. Mở bằng máy chủ tĩnh, nếu không nhạc và
một số hiệu ứng sẽ bị trình duyệt chặn:

```bash
cd BirdDay
python -m http.server 8000
```

Rồi mở http://localhost:8000

Hai công tắc để kiểm tra nhạc (người nhận không bao giờ thấy):

- `?nhac` — hiện bảng chẩn đoán ở góc trên bên trái, ghi rõ đang phát bằng
  đường nào và đã bỏ đường nào vì lý do gì.
- `?yt` — bỏ qua `nhac.mp3`, ép dùng đường YouTube. Đây chính là cách bản
  deploy sẽ chạy, nên dùng cái này để nghe thử trước khi push.

Ghép cả hai: http://localhost:8000/?yt&nhac

## Nhạc chạy thế nào

Trang thử lần lượt 4 đường, hỏng đường nào tụt xuống đường sau:

| # | Đường | Khi nào dùng | Fade + hạ nhạc |
|---|-------|--------------|----------------|
| 1 | `nhac.mp3` cạnh trang | chạy ở máy | có |
| 2 | Trình phát YouTube (JS) | đã deploy lên https | có |
| 3 | Khung YouTube thường | https bị chặn JS API | không |
| 4 | Nhạc tự sinh (Web Audio) | mất mạng hoàn toàn | có |

`nhac.mp3` **không được đẩy lên git** (xem `.gitignore`) vì đó là bản ghi có
bản quyền, đẩy lên repo công khai là phát hành lại ra công cộng. Không sao cả:
khi deploy lên GitHub Pages, trang tự dùng đường 2 và vẫn phát đúng bài
Jay Park — 'Your/My' từ kênh chính thức, vẫn đủ fade và hạ nhạc.

Nên: **ở máy nghe từ mp3, trên mạng nghe từ YouTube.** Cùng một file
`index.html`, không phải sửa gì.

## Ảnh kỷ niệm

Bỏ 15 tấm ảnh vào **cùng thư mục** này, đặt tên đúng:

```
anh01.jpg  anh02.jpg  …  anh15.jpg
```

Cắt dọc tỉ lệ 4:5 (ví dụ 800×1000px) là vừa khung đẹp nhất.
Chưa có ảnh thì trang vẫn chạy, chỗ đó hiện khung pastel ghi số thứ tự.

## Sửa nội dung

Mở `index.html`, tìm khối `KHỐI CẤU HÌNH` (khoảng dòng 1130). Trong đó sửa được:

- `TEN_EM` — tên người nhận
- `NGAY_QUEN` — ngày bắt đầu yêu nhau, dạng `"2023-11-04"`, để hiện bộ đếm
  số ngày ở cuối thư. Để trống `""` thì phần đó tự ẩn.
- `CAU_HOI` — hai câu hỏi ở chương II
- `MOC_THOI_GIAN` — ba mốc ở chương III
- `ANH_KY_NIEM` — chú thích 15 tấm ảnh
- `NHAC_BAT_DAU` — bỏ qua bao nhiêu giây đầu bài
- `NHAC_AM_LUONG` — 0 → 1

Bức thư tay ở cuối nằm thẳng trong HTML, tìm `class="thu-noi-dung"` rồi sửa.

## Deploy lên GitHub Pages

Repo đã có sẵn commit đầu. Đẩy lên:

```bash
cd BirdDay
git push -u origin main
```

Rồi vào **Settings → Pages**, mục *Build and deployment*:
- Source: `Deploy from a branch`
- Branch: `main`, thư mục `/ (root)` → Save

Vài phút sau trang sẽ nằm ở:
`https://jprosun.github.io/BirdDay/`

File `.nojekyll` để GitHub khỏi chạy Jekyll qua thư mục này.
