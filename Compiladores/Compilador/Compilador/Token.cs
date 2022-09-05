namespace Compilador;

public class Token
{
    public int Id { get; set; }
    public string Lexeme { get; set; }
    public int Position { get; set; }

    public Token(int id, string lexeme, int position)
    {
        Id = id;
        Lexeme = lexeme;
        Position = position;
    }

    public override string ToString()
    {
        return Id + " ( " + Lexeme + " ) @ " + Position;
    }
}