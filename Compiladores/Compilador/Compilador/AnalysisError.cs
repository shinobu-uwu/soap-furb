namespace Compilador;

public class AnalysisError : Exception
{
    private int Position { get; set; }

    public AnalysisError(string msg, int position) : base(msg)
    {
        Position = position;
    }

    public AnalysisError(string msg) : base(msg)
    {
        Position = -1;
    }
}