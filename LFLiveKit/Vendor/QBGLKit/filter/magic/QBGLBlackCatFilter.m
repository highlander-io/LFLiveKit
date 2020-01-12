//
//  QBGLBlackCatFilter.m
//  Qubi
//
//  Created by Ken Sun on 2016/8/25.
//  Copyright © 2016年 Qubi. All rights reserved.
//

#import "QBGLBlackCatFilter.h"
#import "QBGLDrawable.h"
#import "QBGLUtils.h"
#import "QBGLProgram.h"

char * const kQBBlackCatFilterVertex;
char * const kQBBlackCatFilterFragment;

@interface QBGLBlackCatFilter ()

@property (strong, nonatomic) QBGLDrawable *curveDrawable;

@end

@implementation QBGLBlackCatFilter

- (instancetype) init {
    self = [self initWithVertexShader:kQBBlackCatFilterVertex fragmentShader:kQBBlackCatFilterFragment];
    if (self) {
        [self loadTextures];
    }
    return self;
}

- (void)loadTextures {
    [super loadTextures];
    GLuint textureId = [QBGLUtils generateTexture];
    Byte arrayOfByte[2048];
    int arrayOfInt1[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 5, 7, 8, 10, 11, 13, 15, 16, 18, 20, 21, 23, 24, 26, 28, 29, 31, 33, 34, 36, 37, 39, 41, 42, 44, 45, 47, 49, 50, 52, 53, 55, 57, 58, 60, 61, 63, 65, 66, 68, 69, 71, 72, 74, 76, 77, 79, 80, 82, 83, 85, 86, 88, 90, 91, 93, 94, 96, 97, 99, 100, 102, 103, 105, 106, 108, 109, 111, 112, 114, 115, 116, 118, 119, 121, 122, 124, 125, 127, 128, 129, 131, 132, 134, 135, 136, 138, 139, 141, 142, 143, 145, 146, 147, 149, 150, 151, 153, 154, 155, 157, 158, 159, 160, 162, 163, 164, 165, 167, 168, 169, 170, 172, 173, 174, 175, 176, 178, 179, 180, 181, 182, 183, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 199, 200, 201, 202, 203, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 215, 216, 217, 218, 219, 220, 220, 221, 222, 223, 224, 224, 225, 226, 227, 227, 228, 229, 229, 230, 231, 232, 232, 233, 234, 234, 235, 236, 236, 237, 238, 238, 239, 240, 240, 241, 242, 242, 243, 243, 244, 245, 245, 246, 247, 247, 248, 248, 249, 250, 250, 251, 251, 252, 253, 253, 254, 254, 255 };
    int arrayOfInt2[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 5, 7, 8, 10, 11, 13, 15, 16, 16, 18, 20, 21, 23, 24, 26, 28, 29, 31, 33, 34, 36, 37, 39, 41, 41, 42, 44, 45, 47, 49, 50, 52, 53, 55, 57, 58, 60, 61, 63, 65, 66, 68, 69, 71, 72, 74, 76, 77, 79, 80, 82, 83, 85, 86, 86, 88, 90, 91, 93, 94, 96, 97, 99, 100, 102, 103, 105, 106, 108, 109, 111, 112, 114, 115, 116, 118, 119, 121, 122, 124, 125, 127, 128, 129, 131, 134, 135, 136, 138, 139, 141, 142, 143, 145, 146, 147, 149, 150, 151, 153, 154, 155, 157, 158, 159, 160, 162, 163, 164, 165, 167, 168, 169, 170, 172, 173, 174, 175, 176, 179, 180, 181, 182, 183, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 199, 200, 201, 203, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 215, 216, 217, 219, 220, 220, 221, 222, 223, 224, 224, 225, 226, 227, 227, 228, 229, 229, 230, 232, 232, 233, 234, 234, 235, 236, 236, 237, 238, 238, 239, 240, 240, 242, 242, 243, 243, 244, 245, 245, 246, 247, 247, 248, 248, 249, 250, 251, 251, 252, 253, 253, 254, 254, 255 };
    int arrayOfInt3[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 3, 5, 7, 8, 10, 10, 11, 13, 15, 16, 18, 20, 20, 21, 23, 24, 26, 28, 29, 29, 31, 33, 34, 36, 37, 39, 39, 41, 42, 44, 45, 47, 49, 50, 50, 52, 53, 55, 57, 58, 60, 61, 63, 63, 65, 66, 68, 69, 71, 72, 74, 76, 77, 79, 79, 80, 82, 83, 85, 86, 88, 90, 91, 93, 94, 96, 97, 99, 100, 100, 102, 103, 105, 106, 108, 109, 111, 112, 114, 115, 116, 118, 119, 121, 122, 124, 125, 127, 128, 129, 131, 132, 134, 135, 136, 138, 139, 141, 142, 143, 145, 146, 147, 149, 150, 151, 153, 154, 155, 157, 158, 159, 160, 162, 164, 165, 167, 168, 169, 170, 172, 173, 174, 175, 176, 178, 179, 180, 181, 182, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 199, 200, 201, 202, 203, 203, 204, 205, 206, 207, 209, 210, 211, 212, 213, 214, 215, 215, 216, 218, 219, 220, 220, 221, 222, 223, 224, 225, 226, 227, 227, 228, 229, 229, 230, 232, 232, 233, 234, 234, 235, 236, 236, 238, 238, 239, 240, 240, 241, 242, 243, 243, 244, 245, 245, 246, 247, 247, 248, 249, 250, 250, 251, 251, 252, 253, 254, 254, 255 };
    for (int i = 0; i < 256; i++){
        arrayOfByte[(i * 4)] = ((Byte)arrayOfInt1[i]);
        arrayOfByte[(1 + i * 4)] = ((Byte)arrayOfInt2[i]);
        arrayOfByte[(2 + i * 4)] = ((Byte)arrayOfInt3[i]);
        arrayOfByte[(3 + i * 4)] = -1;
    }
    int arrayOfInt4[] = { 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 12, 13, 13, 14, 14, 15, 16, 17, 18, 18, 19, 19, 20, 21, 21, 23, 24, 25, 26, 26, 26, 27, 28, 29, 30, 31, 32, 32, 33, 34, 35, 36, 37, 38, 38, 38, 39, 40, 41, 43, 44, 45, 45, 46, 47, 48, 49, 49, 50, 51, 52, 53, 54, 55, 56, 57, 57, 58, 59, 60, 61, 62, 63, 64, 65, 65, 66, 67, 68, 69, 70, 70, 71, 72, 74, 75, 76, 76, 77, 78, 79, 80, 81, 82, 82, 83, 85, 86, 87, 88, 89, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 101, 102, 103, 104, 105, 107, 107, 108, 109, 111, 112, 113, 114, 114, 115, 116, 117, 119, 120, 120, 121, 122, 123, 124, 125, 126, 126, 127, 128, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 139, 141, 142, 143, 144, 145, 145, 146, 147, 148, 149, 151, 151, 153, 154, 155, 156, 157, 158, 158, 159, 160, 161, 162, 163, 165, 166, 167, 168, 169, 170, 170, 171, 172, 173, 174, 175, 177, 178, 179, 180, 181, 182, 183, 183, 184, 185, 186, 189, 189, 190, 191, 192, 193, 194, 195, 195, 196, 198, 199, 201, 202, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 213, 214, 214, 215, 216, 218, 219, 220, 221, 221, 222, 223, 225, 227, 227, 228, 229, 230, 230, 230, 230, 230, 230, 230, 230, 230 };
    int arrayOfInt5[] = { 0, 1, 1, 2, 3, 3, 4, 5, 5, 6, 7, 8, 8, 9, 10, 11, 11, 12, 13, 14, 15, 15, 16, 17, 18, 19, 19, 20, 21, 22, 23, 24, 25, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 39, 40, 41, 42, 43, 44, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 61, 62, 63, 64, 65, 66, 67, 69, 70, 71, 72, 73, 74, 76, 77, 78, 79, 81, 82, 83, 84, 86, 87, 88, 89, 91, 92, 93, 95, 96, 97, 99, 100, 101, 103, 104, 105, 107, 108, 109, 111, 112, 114, 115, 116, 118, 119, 121, 122, 124, 125, 126, 128, 129, 131, 132, 134, 135, 137, 138, 140, 141, 142, 144, 145, 147, 148, 149, 151, 152, 154, 155, 156, 158, 159, 160, 162, 163, 164, 166, 167, 168, 170, 171, 172, 173, 175, 176, 177, 178, 180, 181, 182, 183, 184, 186, 187, 188, 189, 190, 191, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 220, 221, 222, 223, 224, 225, 225, 226, 227, 228, 229, 229, 230, 231, 232, 232, 233, 234, 234, 235, 236, 236, 237, 238, 238, 239, 240, 240, 241, 241, 242, 243, 243, 244, 244, 245, 245, 246, 246, 247, 247, 248, 248, 249, 249, 250, 250, 251, 251, 252, 252, 252, 253, 253, 254, 254, 254, 255, 255 };
    int arrayOfInt6[] = { 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 14, 15, 15, 16, 16, 16, 17, 17, 17, 18, 18, 18, 19, 19, 20, 20, 20, 21, 21, 21, 22, 22, 23, 23, 23, 24, 24, 24, 25, 25, 25, 25, 26, 26, 27, 27, 28, 28, 28, 28, 29, 29, 30, 29, 31, 31, 31, 31, 32, 32, 33, 33, 34, 34, 34, 34, 35, 35, 36, 36, 37, 37, 37, 38, 38, 39, 39, 39, 40, 40, 40, 41, 42, 42, 43, 43, 44, 44, 45, 45, 45, 46, 47, 47, 48, 48, 49, 50, 51, 51, 52, 52, 53, 53, 54, 55, 55, 56, 57, 57, 58, 59, 60, 60, 61, 62, 63, 63, 64, 65, 66, 67, 68, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 88, 89, 90, 91, 93, 94, 95, 96, 97, 98, 100, 101, 103, 104, 105, 107, 108, 110, 111, 113, 115, 116, 118, 119, 120, 122, 123, 125, 127, 128, 130, 132, 134, 135, 137, 139, 141, 143, 144, 146, 148, 150, 152, 154, 156, 158, 160, 163, 165, 167, 169, 171, 173, 175, 178, 180, 182, 185, 187, 189, 192, 194, 197, 199, 201, 204, 206, 209, 211, 214, 216, 219, 221, 224, 226, 229, 232, 234, 236, 239, 241, 245, 247, 250, 252, 255 };
    for (int j = 0; j < 256; j++){
        arrayOfByte[(1024 + j * 4)] = ((Byte)arrayOfInt4[j]);
        arrayOfByte[(1 + (1024 + j * 4))] = ((Byte)arrayOfInt5[j]);
        arrayOfByte[(2 + (1024 + j * 4))] = ((Byte)arrayOfInt6[j]);
        arrayOfByte[(3 + (1024 + j * 4))] = -1;
    }
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 256, 2, 0, GL_RGBA, GL_UNSIGNED_BYTE, &arrayOfByte);
    _curveDrawable = [[QBGLDrawable alloc] initWithTextureId:textureId identifier:@"curve"];
}

- (NSArray<QBGLDrawable*> *)renderTextures {
    return @[_curveDrawable];
}

@end


#define STRING(x) #x

char * const kQBBlackCatFilterVertex = STRING
(
 attribute vec4 position;
 attribute vec4 inputTextureCoordinate;
 
 varying vec2 textureCoordinate;
 
 void main()
 {
     gl_Position = position;
     textureCoordinate = inputTextureCoordinate.xy;
 }
);

char * const kQBBlackCatFilterFragment = STRING
(
 varying highp vec2 textureCoordinate;
 precision highp float;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D curve;
 vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
    
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
 
 vec3 hsv2rgb(vec3 c) {
     vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
     vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
     return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
 }
 
 void main()
{
    float GreyVal;
    lowp vec4 textureColor;
    lowp vec4 textureColorOri;
    float xCoordinate = textureCoordinate.x;
    float yCoordinate = textureCoordinate.y;
    
    highp float redCurveValue;
    highp float greenCurveValue;
    highp float blueCurveValue;
    textureColor = texture2D( inputImageTexture, vec2(xCoordinate, yCoordinate));
    // step1 curve
    redCurveValue = texture2D(curve, vec2(textureColor.r, 0.0)).r;
    greenCurveValue = texture2D(curve, vec2(textureColor.g, 0.0)).g;
    blueCurveValue = texture2D(curve, vec2(textureColor.b, 0.0)).b;
    
    
    //textureColor = vec4(redCurveValue, greenCurveValue, blueCurveValue, 1.0);
    vec3 tColor = vec3(redCurveValue, greenCurveValue, blueCurveValue);
    tColor = rgb2hsv(tColor);
    
    tColor.g = tColor.g * 1.2;
    
    float dStrength = 1.0;
    float dSatStrength = 0.3;
    
    float dGap = 0.0;
    
    if( tColor.r >= 0.0 && tColor.r < 0.417)
    {
        tColor.g = tColor.g + (tColor.g * dSatStrength);
    }
    else if( tColor.r > 0.958 && tColor.r <= 1.0)
    {
        tColor.g = tColor.g + (tColor.g * dSatStrength);
    }
    else if( tColor.r >= 0.875 && tColor.r <= 0.958)
    {
        dGap = abs(tColor.r - 0.875);
        dStrength = (dGap / 0.0833);
        
        tColor.g = tColor.g + (tColor.g * dSatStrength * dStrength);
    }
    else if( tColor.r >= 0.0417 && tColor.r <= 0.125)
    {
        dGap = abs(tColor.r - 0.125);
        dStrength = (dGap / 0.0833);
        
        tColor.g = tColor.g + (tColor.g * dSatStrength * dStrength);
    }
    
    tColor = hsv2rgb(tColor);
    tColor = clamp(tColor, 0.0, 1.0);
    
    redCurveValue = texture2D(curve, vec2(tColor.r, 1.0)).r;
    greenCurveValue = texture2D(curve, vec2(tColor.g, 1.0)).r;
    blueCurveValue = texture2D(curve, vec2(tColor.b, 1.0)).r;
    
    redCurveValue = texture2D(curve, vec2(redCurveValue, 1.0)).g;
    greenCurveValue = texture2D(curve, vec2(greenCurveValue, 1.0)).g;
    blueCurveValue = texture2D(curve, vec2(blueCurveValue, 1.0)).g; 
    
    textureColor = vec4(redCurveValue, greenCurveValue, blueCurveValue, 1.0); 
    
    gl_FragColor = vec4(textureColor.r, textureColor.g, textureColor.b, 1.0); 
}
);
