using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hastane_Bilgi_Sistemi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=HastaneVeriTabani; user ID=postgres; " +
            "password=12345");
        private void tc_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void btn_listele_Click(object sender, EventArgs e)
        {
            string sorgu = "select * from hasta_listele()";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void btn_ekle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("SELECT hasta_ekle(@p1,@p2,@p3,@p4,@p5)", baglanti);
            komut1.Parameters.Add("@p1", NpgsqlTypes.NpgsqlDbType.Char).Value = txt_tc.Text;
            komut1.Parameters.Add("@p2", NpgsqlTypes.NpgsqlDbType.Varchar, 40).Value = txt_ad.Text;
            komut1.Parameters.Add("@p3", NpgsqlTypes.NpgsqlDbType.Varchar, 40).Value = txt_soyad.Text;
            komut1.Parameters.Add("@p4", NpgsqlTypes.NpgsqlDbType.Date).Value = DateTime.Parse(txt_dogumTarihi.Text);
            komut1.Parameters.Add("@p5", NpgsqlTypes.NpgsqlDbType.Char).Value = txt_telNo.Text;
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("HASTA EKLEME BASARILI!");
        }

        private void btn_ara_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut6 = new NpgsqlCommand("SELECT * FROM hasta_ara(@p1)", baglanti);
            komut6.Parameters.AddWithValue("@p1", txt_tc.Text);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(komut6);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();
        }

        private void btn_guncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut4 = new NpgsqlCommand("update hasta set \"Soyadi\" = @p1, \"TelNo\" = @p2 where \"TCKimlikNo\" = @p3", baglanti);
            komut4.Parameters.AddWithValue("@p1", txt_soyad.Text);
            komut4.Parameters.AddWithValue("@p2", txt_telNo.Text);
            komut4.Parameters.AddWithValue("@p3", txt_tc.Text);
            komut4.ExecuteNonQuery();
            MessageBox.Show("HASTA GUNCELLEME BASARILI!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            baglanti.Close();
        }

        private void btn_sil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut5 = new NpgsqlCommand("SELECT hasta_sil(@p1)", baglanti);
            komut5.Parameters.AddWithValue("@p1", txt_tc.Text);
            komut5.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("HASTA KAYDI SILINDI!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }
    }
}
