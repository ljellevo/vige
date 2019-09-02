
package utils;

 /* ARGB color type based on a 32-bit integer.
 */
abstract Color(Int) from Int to Int {
  /**
   * Predefined color constants for common colors.
   */
  public static inline var TRANSPARENT : Color = 0x00000000;
  public static inline var BLACK : Color = 0xff000000;
  public static inline var WHITE : Color = 0xffffffff;
  public static inline var RED : Color = 0xffff0000;
  public static inline var GREEN : Color = 0xff00ff00;
  public static inline var BLUE : Color = 0xff0000ff;
  public static inline var CYAN : Color = 0xff00ffff;
  public static inline var MAGENTA : Color = 0xffff00ff;
  public static inline var YELLOW : Color = 0xffffff00;
  
  /**
   * Performs implicit casting from an RGBA hex string to a color.
   * @param   rgba  RGBA hex string
   * @return  Color based on hex string
   */
  @:from public static inline function fromString(rgba : String) : Color {
    return new Color(Std.parseInt(rgba));
  }
  
  /**
   * Creates a new color from integer color components.
   * @param   r   Red channel value
   * @param   g   Green channel value
   * @param   b   Blue channel value
   * @param   a   Alpha channel value
   * @return  Color based on color components
   */
  public static inline function fromRGBAi(r : Int, g : Int, b : Int, a : Int) : Color {
    return new Color((r << 16) | (g << 8) | b | (a << 24));
  }
  
  /**
   * Creates a new color from floating point color components.
   * @param   r   Red channel value
   * @param   g   Green channel value
   * @param   b   Blue channel value
   * @param   a   Alpha channel value
   * @return  Color based on color components
   */
  public static inline function fromRGBAf(r : Float, g : Float, b : Float, a : Float) : Color {
    return fromRGBAi(Std.int(r * 255), Std.int(g * 255), Std.int(b * 255), Std.int(a * 255));
  }
  
  /**
   * Constructs a new color.
   * @param   rgba  Color formatted as ARGB integer
   */
  inline function new(rgba : Int) this = rgba;
  
  /**
   * Integer color channel getters and setters.
   */

  public var ai(get, set) : Int;
  inline function get_ai() return (this >> 24) & 0xff;
  inline function set_ai(ai : Int) { this = fromRGBAi(ri, gi, bi, ai); return ai; }
  
  public var ri(get, set) : Int;
  inline function get_ri() return (this >> 16) & 0xff;
  inline function set_ri(ri : Int) { this = fromRGBAi(ri, gi, bi, ai); return ri; }
  
  public var gi(get, set) : Int;
  inline function get_gi() return (this >> 8) & 0xff;
  inline function set_gi(gi : Int) { this = fromRGBAi(ri, gi, bi, ai); return gi; }
  
  public var bi(get, set) : Int;
  inline function get_bi() return this & 0xff;
  inline function set_bi(bi : Int) { this = fromRGBAi(ri, gi, bi, ai); return bi; }
  
  /**
   * Floating point color channel getters and setters.
   */

  public var af(get, set) : Float;
  inline function get_af() return ai / 255;
  inline function set_af(af : Float) { this = fromRGBAf(rf, gf, bf, af); return af; }
  
  public var rf(get, set) : Float;
  inline function get_rf() return ri / 255;
  inline function set_rf(rf : Float) { this = fromRGBAf(rf, gf, bf, af); return rf; }
  
  public var gf(get, set) : Float;
  inline function get_gf() return gi / 255;
  inline function set_gf(gf : Float) { this = fromRGBAf(rf, gf, bf, af); return gf; }
  
  public var bf(get, set) : Float;
  inline function get_bf() return bi / 255;
  inline function set_bf(bf : Float) { this = fromRGBAf(rf, gf, bf, af); return bf; }
}