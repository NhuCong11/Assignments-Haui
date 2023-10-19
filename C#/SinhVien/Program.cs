using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinhVien
{
    struct SinhVien
    {
        public int iD;
        public string name;
        public string gender;
        public int age;
        public double mathScore;
        public double physicsScore;
        public double chemistryScore;
        public double averageScore;
        public string academicPerformance; 
    }
    internal class Program
    {
        static List<SinhVien> students = new List<SinhVien>();
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            string loadStudentsFromFile = "student.txt";
            int choice;

            do
            {
                Console.WriteLine("------ Menu: -----");
                Console.WriteLine("1. Thêm sinh viên.");
                Console.WriteLine("2. Cập nhật thông tin sinh viên bởi ID.");
                Console.WriteLine("3. Xóa sinh viên bởi ID.");
                Console.WriteLine("4. Tìm kiếm sinh viên theo tên.");
                Console.WriteLine("5. Sắp xếp sinh viên theo điểm trung bình.");
                Console.WriteLine("6. Sắp xếp sinh viên theo tên.");
                Console.WriteLine("7. Hiển thị danh sách sinh viên.");
                Console.WriteLine("8. Ghi danh sách sinh viên vào file.");
                Console.WriteLine("0. Thoát chương trình.");
                Console.Write("Nhập lựa chọn: ");
                

                if (int.TryParse(Console.ReadLine(), out choice))
                {
                    switch (choice)
                    {
                        case 1:
                            AddStudent();
                            break;
                        case 2:
                            UpdateStudent();
                            break;
                        case 3:
                            DeleteStudent();
                            break;
                        case 4:
                            SearchStudentByName();
                            break;
                        case 5:
                            SortStudentsByAverageScore();
                            break;
                        case 6:
                            SortStudentsByName();
                            break;
                        case 7:
                            DisplayStudents();
                            break;
                        case 8:
                            SaveStudentsToFile("student.txt");
                            break;
                        case 0:
                            Console.WriteLine("Kết thúc chương trình.");
                            break;
                        default:
                            Console.WriteLine("Lựa chọn không hợp lệ.");
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("Lựa chọn không hợp lệ. Vui lòng nhập lại.");
                }
                
            } while (choice != 0);

            Console.ReadLine();
        }

        static void AddStudent()
        {
            SinhVien student = new SinhVien();
            student.iD = students.Count > 0 ? students.Max(s => s.iD) + 1 : 1;

            Console.Write("Nhập tên: ");
            student.name = Console.ReadLine();

            Console.Write("Nhập giới tính: ");
            student.gender = Console.ReadLine();

            Console.Write("Nhập tuổi: ");
            if (int.TryParse(Console.ReadLine(), out int age))
            {
                student.age = age;
            }
            else
            {
                Console.WriteLine("Tuổi không hợp lệ.");
                return;
            }

            Console.Write("Nhập điểm Toán: ");
            if (double.TryParse(Console.ReadLine(), out double mathScore))
            {
                student.mathScore = mathScore;
            }
            else
            {
                Console.WriteLine("Điểm Toán không hợp lệ.");
                return;
            }

            Console.Write("Nhập điểm Lý: ");
            if (double.TryParse(Console.ReadLine(), out double physicsScore))
            {
                student.physicsScore = physicsScore;
            }
            else
            {
                Console.WriteLine("Điểm Lý không hợp lệ.");
                return;
            }

            Console.Write("Nhập điểm Hóa: ");
            if (double.TryParse(Console.ReadLine(), out double chemistryScore))
            {
                student.chemistryScore = chemistryScore;
            }
            else
            {
                Console.WriteLine("Điểm Hóa không hợp lệ.");
                return;
            }

            student.averageScore = (student.mathScore + student.physicsScore + student.chemistryScore) / 3;
            student.academicPerformance = CalculateAcademicPerformance(student.averageScore);

            students.Add(student);
            Console.WriteLine("Sinh viên đã được thêm vào danh sách.");
        }

        static void UpdateStudent()
        {
            Console.Write("Nhập ID của sinh viên cần cập nhật: ");
            if (int.TryParse(Console.ReadLine(), out int id))
            {
                SinhVien student = students.FirstOrDefault(s => s.iD == id);
                if (student.Equals(default(SinhVien)))
                {
                    Console.WriteLine("Không tìm thấy sinh viên với ID đã nhập.");
                }
                else
                {
                    Console.WriteLine("Thông tin hiện tại của sinh viên:");
                    DisplayStudentDetails(student);

                    Console.WriteLine("Nhập thông tin cập nhật:");
                    Console.Write("Tên: ");
                    student.name = Console.ReadLine();

                    Console.Write("Giới tính: ");
                    student.gender = Console.ReadLine();

                    Console.Write("Tuổi: ");
                    if (int.TryParse(Console.ReadLine(), out int age))
                    {
                        student.age = age;
                    }
                    else
                    {
                        Console.WriteLine("Tuổi không hợp lệ. Không thay đổi.");
                    }

                    Console.Write("Điểm Toán: ");
                    if (double.TryParse(Console.ReadLine(), out double mathScore))
                    {
                        student.mathScore = mathScore;
                    }
                    else
                    {
                        Console.WriteLine("Điểm Toán không hợp lệ. Không thay đổi.");
                    }

                    Console.Write("Điểm Lý: ");
                    if (double.TryParse(Console.ReadLine(), out double physicsScore))
                    {
                        student.physicsScore = physicsScore;
                    }
                    else
                    {
                        Console.WriteLine("Điểm Lý không hợp lệ. Không thay đổi.");
                    }

                    Console.Write("Điểm Hóa: ");
                    if (double.TryParse(Console.ReadLine(), out double chemistryScore))
                    {
                        student.chemistryScore = chemistryScore;
                    }
                    else
                    {
                        Console.WriteLine("Điểm Hóa không hợp lệ. Không thay đổi.");
                    }

                    student.averageScore = (student.mathScore + student.physicsScore + student.chemistryScore) / 3;
                    student.academicPerformance = CalculateAcademicPerformance(student.averageScore);

                    Console.WriteLine("Thông tin của sinh viên đã được cập nhật.");
                }
            }
            else
            {
                Console.WriteLine("ID không hợp lệ.");
            }
        }

        static void DeleteStudent()
        {
            Console.Write("Nhập ID của sinh viên cần xóa: ");
            if (int.TryParse(Console.ReadLine(), out int id))
            {
                SinhVien student = students.FirstOrDefault(s => s.iD == id);
                if (student.Equals(default(SinhVien)))
                {
                    Console.WriteLine("Không tìm thấy sinh viên với ID đã nhập.");
                }
                else
                {
                    students.Remove(student);
                    Console.WriteLine("Sinh viên đã được xóa khỏi danh sách.");
                }
            }
            else
            {
                Console.WriteLine("ID không hợp lệ.");
            }
        }

        static void SearchStudentByName()
        {
            Console.Write("Nhập tên sinh viên cần tìm: ");
            string nameToSearch = Console.ReadLine();

            List<SinhVien> matchingStudents = students.Where(s => s.name.ToLower().Contains(nameToSearch.ToLower())).ToList();
            if (matchingStudents.Count == 0)
            {
                Console.WriteLine("Không tìm thấy sinh viên nào với tên đã nhập.");
            }
            else
            {
                Console.WriteLine("Danh sách sinh viên phù hợp:");
                DisplayStudents(matchingStudents);
            }
        }

        static void SortStudentsByAverageScore()
        {
            List<SinhVien> sortedStudents = students.OrderBy(s => s.averageScore).ToList();
            Console.WriteLine("Danh sách sinh viên được sắp xếp theo điểm trung bình:");
            DisplayStudents(sortedStudents);
        }

        static void SortStudentsByName()
        {
            List<SinhVien> sortedStudents = students.OrderBy(s => s.name).ToList();
            Console.WriteLine("Danh sách sinh viên được sắp xếp theo tên:");
            DisplayStudents(sortedStudents);
        }

        static void DisplayStudents(List<SinhVien> studentList = null)
        {
            List<SinhVien> displayList = studentList ?? students;
            foreach (var student in displayList)
            {
                DisplayStudentDetails(student);
            }
        }

        static void DisplayStudentDetails(SinhVien student)
        {
            Console.WriteLine($"ID: {student.iD}");
            Console.WriteLine($"Tên: {student.name}");
            Console.WriteLine($"Giới tính: {student.gender}");
            Console.WriteLine($"Tuổi: {student.age}");
            Console.WriteLine($"Điểm Toán: {student.mathScore}");
            Console.WriteLine($"Điểm Lý: {student.physicsScore}");
            Console.WriteLine($"Điểm Hóa: {student.chemistryScore}");
            Console.WriteLine($"Điểm Trung bình: {student.averageScore}");
            Console.WriteLine($"Học lực: {student.academicPerformance}");
            Console.WriteLine("--------------------------");
        }

        static string CalculateAcademicPerformance(double averageScore)
        {
            if (averageScore >= 8.0)
            {
                return "Giỏi";
            }
            else if (averageScore >= 6.5)
            {
                return "Khá";
            }
            else if (averageScore >= 5.0)
            {
                return "Trung Bình";
            }
            else
            {
                return "Yếu";
            }
        }

        static void LoadStudentsFromFile(string filePath)
        {
            try
            {
                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    foreach (string line in lines)
                    {
                        string[] parts = line.Split(',');
                        if (parts.Length == 9)
                        {
                            SinhVien student = new SinhVien();
                            student.iD = int.Parse(parts[0]);
                            student.name = parts[1];
                            student.gender = parts[2];
                            student.age = int.Parse(parts[3]);
                            student.mathScore = double.Parse(parts[4]);
                            student.physicsScore = double.Parse(parts[5]);
                            student.chemistryScore = double.Parse(parts[6]);
                            student.averageScore = double.Parse(parts[7]);
                            student.academicPerformance = parts[8];
                            students.Add(student);
                        }
                    }
                    Console.WriteLine("Danh sách sinh viên đã được nạp từ file.");
                }
                else
                {
                    Console.WriteLine("File không tồn tại. Sẽ tạo mới khi ghi danh sách sinh viên vào file.");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"Lỗi khi nạp danh sách sinh viên từ file: {e.Message}");
            }
        }

        static void SaveStudentsToFile(string filePath)
        {
            try
            {
                using (StreamWriter writer = new StreamWriter(filePath))
                {
                    foreach (var student in students)
                    {
                        writer.WriteLine($"{student.iD},{student.name},{student.gender},{student.age},{student.mathScore},{student.physicsScore},{student.chemistryScore},{student.averageScore},{student.academicPerformance}");
                    }
                }
                Console.WriteLine("Danh sách sinh viên đã được ghi vào file.");
            }
            catch (Exception e)
            {
                Console.WriteLine($"Lỗi khi ghi danh sách sinh viên vào file: {e.Message}");
            }
        }
    }
}
