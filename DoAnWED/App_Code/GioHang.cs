using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GioHang
/// </summary>
public class GioHang
{
    private string mahang, tenhang, hinh;
    private int soluong, gia, thanhtien;

    public string Hinh
    {
        get { return hinh; }
        set { hinh = value; }
    }
    public string Mahang
    {
        get { return mahang; }
        set { mahang = value; }
    }
    public string Tenhang
    {
        get { return tenhang; }
        set { tenhang = value; }
    }
    public int Soluong
    {
        get { return soluong; }
        set { soluong = value; }
    }
    public int Gia
    {
        get { return gia; }
        set { gia = value; }
    }
    public int Thanhtien
    {
        get { return soluong * gia; } 
    }
	public GioHang()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}