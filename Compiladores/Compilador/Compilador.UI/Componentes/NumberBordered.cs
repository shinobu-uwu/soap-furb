namespace Compilador.UI.Componentes;

public class NumberedBorder
{
    private static int _lineHeight;
    private const int CharacterHeight = 8;
    private const int CharacterWidth = 7;
    private readonly Color _color = Color.Black;

    public void PaintBorder(RichTextBox textBox, Graphics g, int height)
    {
        var font = textBox.Font;
        _lineHeight = font.Height;

        var r = (double)height / (double)_lineHeight;
        var rows = (int)(r + 0.5);
        var str = rows.ToString();
        var lineLeft = CalculateLeft(height) + 10;

        var px = 13;
        var py = 0;
        var lenght = 0;

        var visibleLines = textBox.Height / _lineHeight;
        for (var i = 0; i < visibleLines; i++)
        {
            str = $"{i + 1}";
            lenght = str.Length;

            py = _lineHeight * i + textBox.Location.Y;
            px = lineLeft - (CharacterWidth * lenght) - 2;

            g.DrawString(str, textBox.Font, new SolidBrush(_color), px, py);
        }
    }

    private int CalculateLeft(int height)
    {
        var r = (double)height / (double)_lineHeight;
        var rows = (int)(r + 0.5);
        var str = rows.ToString();
        var lenght = str.Length;
        return CharacterHeight * lenght;
    }
}