//
//  QBGLNostalgiaFilter.m
//  Qubi
//
//  Created by Ken Sun on 2016/8/27.
//  Copyright © 2016年 Qubi. All rights reserved.
//

#import "QBGLNostalgiaFilter.h"
#import "QBGLDrawable.h"
#import "QBGLUtils.h"
#import "QBGLProgram.h"

char * const kQBNostalgiaFilterVertex;
char * const kQBNostalgiaFilterFragment;

@interface QBGLNostalgiaFilter ()

@property (strong, nonatomic) QBGLDrawable *curveDrawable;
@property (strong, nonatomic) QBGLDrawable *curve2Drawable;

@end

@implementation QBGLNostalgiaFilter

- (instancetype) init {
    self = [self initWithVertexShader:kQBNostalgiaFilterVertex fragmentShader:kQBNostalgiaFilterFragment];
    if (self) {
        [self loadTextures];
    }
    return self;
}

- (void)loadTextures {
    [super loadTextures];
    GLuint textureId = [QBGLUtils generateTexture];
    Byte arrayOfByte1[2048];
    int arrayOfInt1[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 5, 6, 8, 9, 11, 13, 15, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 39, 41, 43, 45, 47, 49, 50, 52, 54, 56, 57, 59, 61, 62, 64, 66, 68, 69, 71, 72, 74, 76, 77, 79, 80, 82, 84, 85, 87, 88, 90, 91, 93, 94, 96, 97, 98, 100, 101, 103, 104, 106, 107, 108, 110, 111, 112, 114, 115, 116, 118, 119, 120, 122, 123, 124, 125, 127, 128, 129, 130, 131, 133, 134, 135, 136, 137, 138, 140, 141, 142, 143, 144, 145, 146, 147, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 174, 175, 176, 177, 178, 179, 180, 181, 182, 182, 183, 184, 185, 186, 187, 188, 188, 189, 190, 191, 192, 193, 193, 194, 195, 196, 197, 197, 198, 199, 200, 201, 201, 202, 203, 204, 204, 205, 206, 207, 207, 208, 209, 210, 210, 211, 212, 213, 213, 214, 215, 216, 216, 217, 218, 219, 219, 220, 221, 221, 222, 223, 224, 224, 225, 226, 226, 227, 228, 228, 229, 230, 231, 231, 232, 233, 233, 234, 235, 235, 236, 237, 237, 238, 239, 240, 240, 241, 242, 242, 243, 244, 244, 245, 246, 246, 247, 248, 248, 249, 250, 250, 251, 252, 252, 253, 254, 254, 255 };
    int arrayOfInt2[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 4, 6, 7, 9, 10, 12, 13, 14, 16, 17, 19, 20, 22, 23, 24, 26, 27, 29, 30, 32, 33, 34, 36, 37, 39, 40, 42, 43, 44, 46, 47, 49, 50, 52, 53, 54, 56, 57, 59, 60, 61, 63, 64, 66, 67, 69, 70, 71, 73, 74, 75, 77, 78, 80, 81, 82, 84, 85, 87, 88, 89, 91, 92, 93, 95, 96, 97, 99, 100, 101, 103, 104, 105, 107, 108, 109, 111, 112, 113, 115, 116, 117, 119, 120, 121, 122, 124, 125, 126, 127, 129, 130, 131, 132, 134, 135, 136, 137, 139, 140, 141, 142, 144, 145, 146, 147, 148, 149, 151, 152, 153, 154, 155, 156, 158, 159, 160, 161, 162, 163, 164, 165, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 198, 199, 200, 201, 202, 203, 204, 204, 205, 206, 207, 208, 209, 209, 210, 211, 212, 213, 213, 214, 215, 216, 216, 217, 218, 219, 219, 220, 221, 222, 222, 223, 224, 225, 225, 226, 227, 227, 228, 229, 229, 230, 231, 231, 232, 233, 233, 234, 235, 235, 236, 237, 237, 238, 239, 239, 240, 241, 241, 242, 243, 243, 244, 244, 245, 246, 246, 247, 248, 248, 249, 249, 250, 251, 251, 252, 253, 253, 254, 254, 255 };
    int arrayOfInt3[] = { 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 31, 33, 35, 37, 39, 41, 43, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 65, 67, 69, 71, 73, 75, 76, 78, 80, 82, 84, 85, 87, 89, 91, 92, 94, 96, 98, 99, 101, 102, 104, 106, 107, 109, 110, 112, 114, 115, 117, 118, 119, 121, 122, 124, 125, 126, 128, 129, 130, 132, 133, 134, 135, 137, 138, 139, 140, 141, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 166, 167, 168, 169, 170, 171, 171, 172, 173, 174, 175, 175, 176, 177, 178, 178, 179, 180, 181, 181, 182, 183, 184, 184, 185, 186, 186, 187, 188, 189, 189, 190, 191, 191, 192, 193, 193, 194, 195, 195, 196, 197, 197, 198, 199, 200, 200, 201, 202, 202, 203, 204, 204, 205, 206, 206, 207, 208, 208, 209, 210, 210, 211, 212, 212, 213, 214, 214, 215, 216, 216, 217, 218, 218, 219, 220, 220, 221, 221, 222, 223, 223, 224, 225, 225, 226, 227, 227, 228, 229, 229, 230, 231, 231, 232, 233, 233, 234, 234, 235, 236, 236, 237, 238, 238, 239, 240, 240, 241, 242, 242, 243, 243, 244, 245, 245, 246, 247, 247, 248, 249, 249, 250, 251, 251, 252, 252, 253, 254, 254, 255 };
    int arrayOfInt4[] = { 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 14, 15, 15, 16, 16, 16, 17, 17, 17, 18, 18, 18, 19, 19, 20, 20, 20, 21, 21, 21, 22, 22, 23, 23, 23, 24, 24, 24, 25, 25, 25, 25, 26, 26, 27, 27, 28, 28, 28, 28, 29, 29, 30, 29, 31, 31, 31, 31, 32, 32, 33, 33, 34, 34, 34, 34, 35, 35, 36, 36, 37, 37, 37, 38, 38, 39, 39, 39, 40, 40, 40, 41, 42, 42, 43, 43, 44, 44, 45, 45, 45, 46, 47, 47, 48, 48, 49, 50, 51, 51, 52, 52, 53, 53, 54, 55, 55, 56, 57, 57, 58, 59, 60, 60, 61, 62, 63, 63, 64, 65, 66, 67, 68, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 88, 89, 90, 91, 93, 94, 95, 96, 97, 98, 100, 101, 103, 104, 105, 107, 108, 110, 111, 113, 115, 116, 118, 119, 120, 122, 123, 125, 127, 128, 130, 132, 134, 135, 137, 139, 141, 143, 144, 146, 148, 150, 152, 154, 156, 158, 160, 163, 165, 167, 169, 171, 173, 175, 178, 180, 182, 185, 187, 189, 192, 194, 197, 199, 201, 204, 206, 209, 211, 214, 216, 219, 221, 224, 226, 229, 232, 234, 236, 239, 241, 245, 247, 250, 252, 255 };
    for (int i = 0; i < 256; i++){
        arrayOfByte1[(0 + i * 4)] = ((Byte)arrayOfInt1[i]);
        arrayOfByte1[(1 + i * 4)] = ((Byte)arrayOfInt2[i]);
        arrayOfByte1[(2 + i * 4)] = ((Byte)arrayOfInt3[i]);
        arrayOfByte1[(3 + i * 4)] = ((Byte)arrayOfInt4[i]);
    }
    int arrayOfInt5[] = { 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 30, 32, 33, 34, 35, 37, 38, 39, 41, 42, 43, 44, 46, 47, 48, 50, 51, 52, 53, 55, 56, 57, 58, 60, 61, 62, 64, 65, 66, 67, 69, 70, 71, 72, 74, 75, 76, 77, 79, 80, 81, 82, 84, 85, 86, 87, 88, 90, 91, 92, 93, 95, 96, 97, 98, 99, 101, 102, 103, 104, 105, 107, 108, 109, 110, 111, 112, 114, 115, 116, 117, 118, 119, 121, 122, 123, 124, 125, 126, 127, 128, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 174, 175, 176, 177, 178, 179, 180, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 198, 199, 200, 201, 202, 204, 205, 206, 207, 209, 210, 211, 213, 214, 215, 217, 218, 220, 221, 222, 224, 225, 227, 228, 230, 231, 233, 234, 235, 237, 238, 240, 241, 243, 244, 246, 247, 249, 250, 252, 253, 255 };
    int arrayOfInt6[] = { 0, 3, 6, 8, 11, 14, 16, 18, 21, 24, 26, 29, 30, 33, 35, 37, 39, 41, 43, 45, 47, 49, 50, 52, 53, 54, 56, 58, 59, 61, 62, 63, 65, 65, 66, 68, 69, 70, 72, 73, 74, 75, 76, 77, 78, 79, 80, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 112, 113, 114, 115, 115, 116, 117, 118, 119, 120, 121, 122, 123, 123, 124, 125, 126, 127, 127, 128, 129, 130, 131, 132, 133, 134, 135, 135, 135, 136, 137, 138, 139, 140, 140, 141, 142, 143, 144, 145, 146, 146, 147, 147, 148, 149, 149, 150, 151, 152, 153, 154, 154, 155, 156, 157, 158, 158, 159, 159, 160, 161, 161, 162, 163, 164, 164, 165, 166, 167, 167, 168, 169, 170, 170, 170, 171, 172, 173, 173, 174, 175, 176, 176, 177, 178, 179, 179, 180, 181, 181, 182, 182, 183, 183, 184, 185, 186, 186, 187, 188, 188, 189, 190, 191, 191, 192, 193, 193, 194, 194, 194, 195, 196, 197, 197, 198, 199, 199, 200, 201, 201, 202, 203, 203, 204, 205, 205, 206, 206, 207, 207, 208, 209, 209, 210, 211, 211, 212, 213, 213, 214, 215, 215, 216, 217, 217, 217, 217, 218, 219, 219, 220, 221, 221, 222, 223, 223, 224, 225, 225, 226, 227, 227, 228, 228, 229, 229, 229, 230, 231, 231, 232, 232, 233, 234, 234, 235 };
    int arrayOfInt7[] = { 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 89, 90, 91, 92, 93, 94, 96, 97, 98, 99, 100, 102, 103, 104, 106, 107, 108, 109, 111, 112, 113, 115, 116, 118, 119, 120, 122, 123, 125, 126, 128, 129, 131, 132, 134, 135, 137, 139, 140, 142, 143, 145, 147, 148, 150, 152, 153, 155, 156, 158, 160, 161, 163, 164, 166, 167, 169, 170, 172, 173, 175, 176, 178, 179, 180, 182, 183, 185, 186, 188, 189, 190, 192, 193, 194, 196, 197, 199, 200, 201, 203, 204, 205, 206, 208, 209, 210, 212, 213, 214, 216, 217, 218, 219, 221, 222, 223, 224, 226, 227, 228, 229, 231, 232, 233, 234, 236, 237, 238, 239, 240, 242, 243, 244, 245, 247, 248, 249, 250, 251, 253, 254, 255 };
    for (int j = 0; j < 256; j++){
        arrayOfByte1[(0 + (1024 + j * 4))] = ((Byte)arrayOfInt5[j]);
        arrayOfByte1[(1 + (1024 + j * 4))] = ((Byte)arrayOfInt6[j]);
        arrayOfByte1[(2 + (1024 + j * 4))] = ((Byte)arrayOfInt7[j]);
        arrayOfByte1[(3 + (1024 + j * 4))] = ((Byte)arrayOfInt4[j]);
    }
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 256, 2, 0, GL_RGBA, GL_UNSIGNED_BYTE, &arrayOfByte1);
    _curveDrawable = [[QBGLDrawable alloc] initWithTextureId:textureId identifier:@"curve"];
    textureId = [QBGLUtils generateTexture];
    Byte arrayOfByte2[1024];
    int arrayOfInt8[] = { 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 14, 15, 15, 16, 16, 16, 17, 17, 17, 18, 18, 18, 19, 19, 20, 20, 20, 21, 21, 21, 22, 22, 23, 23, 23, 24, 24, 24, 25, 25, 25, 25, 26, 26, 27, 27, 28, 28, 28, 28, 29, 29, 30, 29, 31, 31, 31, 31, 32, 32, 33, 33, 34, 34, 34, 34, 35, 35, 36, 36, 37, 37, 37, 38, 38, 39, 39, 39, 40, 40, 40, 41, 42, 42, 43, 43, 44, 44, 45, 45, 45, 46, 47, 47, 48, 48, 49, 50, 51, 51, 52, 52, 53, 53, 54, 55, 55, 56, 57, 57, 58, 59, 60, 60, 61, 62, 63, 63, 64, 65, 66, 67, 68, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 88, 89, 90, 91, 93, 94, 95, 96, 97, 98, 100, 101, 103, 104, 105, 107, 108, 110, 111, 113, 115, 116, 118, 119, 120, 122, 123, 125, 127, 128, 130, 132, 134, 135, 137, 139, 141, 143, 144, 146, 148, 150, 152, 154, 156, 158, 160, 163, 165, 167, 169, 171, 173, 175, 178, 180, 182, 185, 187, 189, 192, 194, 197, 199, 201, 204, 206, 209, 211, 214, 216, 219, 221, 224, 226, 229, 232, 234, 236, 239, 241, 245, 247, 250, 252, 255 };
    int arrayOfInt9[] = { 42, 43, 43, 44, 45, 45, 46, 47, 48, 48, 49, 50, 50, 51, 52, 52, 53, 54, 55, 55, 56, 57, 57, 58, 59, 60, 60, 61, 62, 62, 63, 64, 65, 65, 66, 67, 67, 68, 69, 70, 70, 71, 72, 72, 73, 74, 75, 75, 76, 77, 78, 78, 79, 80, 81, 81, 82, 83, 84, 84, 85, 86, 87, 87, 88, 89, 90, 91, 91, 92, 93, 94, 94, 95, 96, 97, 98, 98, 99, 100, 101, 102, 103, 103, 104, 105, 106, 107, 108, 108, 109, 110, 111, 112, 113, 113, 114, 115, 116, 117, 118, 119, 120, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 201, 202, 203, 204, 205, 206, 207, 207, 208, 209, 210, 211, 212, 212, 213, 214, 215, 216, 217, 217, 218, 219, 220, 221, 221, 222, 223, 224, 224, 225, 226, 227, 228, 228, 229, 230, 231, 231, 232, 233, 234, 234, 235, 236, 237, 237, 238, 239, 240, 240, 241, 242, 243, 243, 244, 245, 246, 246, 247, 248, 248, 249, 250, 251, 251, 252, 253, 254, 254, 255 };
    int arrayOfInt10[] = { 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 198, 199, 200, 201, 202, 203, 204, 205, 205, 206, 207, 208, 209, 210, 211, 211, 212, 213, 214, 215, 215, 216, 217, 218, 219, 219, 220, 221, 222, 222, 223, 224, 225, 225, 226, 227, 227, 228, 229, 230, 230, 231, 232, 232, 233, 234, 234, 235, 236, 236, 237, 238, 238, 239, 240, 240, 241, 241, 242, 243, 243, 244, 245, 245, 246, 246, 247, 248, 248, 249, 250, 250, 251, 251, 252, 253, 253, 254, 254, 255 };
    int arrayOfInt11[] = { 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 174, 175, 176, 177, 178, 179, 180, 181, 182, 182, 183, 184, 185, 186, 187, 188, 189, 190, 190, 191, 192, 193, 194, 195, 196, 197, 197, 198, 199, 200, 201, 202, 203, 203, 204, 205, 206, 207, 208, 209, 209, 210, 211, 212, 213, 214, 214, 215, 216, 217, 218, 219, 219, 220, 221, 222, 223, 224, 224, 225, 226, 227, 228, 229, 229, 230, 231, 232, 233, 234, 234, 235, 236, 237, 238, 239, 239, 240, 241, 242, 243, 244, 244, 245, 246, 247, 248, 248, 249, 250, 251, 252, 253, 253, 254, 255 };
    for (int k = 0; k < 256; k++){
        arrayOfByte2[(0 + k * 4)] = ((Byte)arrayOfInt9[k]);
        arrayOfByte2[(1 + k * 4)] = ((Byte)arrayOfInt10[k]);
        arrayOfByte2[(2 + k * 4)] = ((Byte)arrayOfInt11[k]);
        arrayOfByte2[(3 + k * 4)] = ((Byte)arrayOfInt8[k]);
    }
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 256, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, &arrayOfByte1);
    _curve2Drawable = [[QBGLDrawable alloc] initWithTextureId:textureId identifier:@"curve2"];
    [self.program setParameter:"blurSize" floatValue:1.0];
}

- (NSArray<QBGLDrawable*> *)renderTextures {
    return @[_curveDrawable, _curve2Drawable];
}

- (void)setAdditionalUniformVarsForRender {
    [super setAdditionalUniformVarsForRender];
    
    [self.program setParameter:"texelWidthOffset" floatValue:1 / self.inputSize.width];
    [self.program setParameter:"texelHeightOffset" floatValue:1 / self.inputSize.height];
}

@end


#define STRING(x) #x

char * const kQBNostalgiaFilterVertex = STRING
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

char * const kQBNostalgiaFilterFragment = STRING
(
 varying highp vec2 textureCoordinate;
 precision highp float;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D curve;
 uniform sampler2D curve2;
 uniform highp float texelWidthOffset;
 uniform highp float texelHeightOffset;
 uniform highp float blurSize;
 
 vec4 OverlayBlendingVec4(vec4 down, vec4 up, float fAlpha)
{
    if ( down.r < 0.5 )
    {
        up.r = up.r * down.r * 2.0;
    }
    else
    {
        up.r = 1.0 - ( ( 1.0 - down.r) * ( 1.0 - up.r ) * 2.0 );
    }
    if ( down.g < 0.5 )
    {
        up.g = up.g * down.g * 2.0;
    }
    else
    {
        up.g = 1.0 - ( ( 1.0 - down.g) * ( 1.0 - up.g ) * 2.0 );
    }
    
    if ( down.b < 0.5 )
    {
        up.b = up.b * down.b * 2.0;
    }
    else
    {
        up.b = 1.0 - ( ( 1.0 - down.b) * ( 1.0 - up.b ) * 2.0 );
    }
    
    down = ( up - down ) * fAlpha + down;
    
    return down;
}
 
 void main()
{
    float xCoordinate = textureCoordinate.x;
    float yCoordinate = textureCoordinate.y;
    
    vec4 textureColor = texture2D( inputImageTexture, vec2(xCoordinate, yCoordinate));
    highp vec2 firstOffset = vec2(1.3846153846 * texelWidthOffset, 1.3846153846 * texelHeightOffset) * blurSize;
    highp vec2 secondOffset = vec2(3.2307692308 * texelWidthOffset, 3.2307692308 * texelHeightOffset) * blurSize;
    
    highp vec2 centerTextureCoordinate = vec2(xCoordinate, yCoordinate);
    highp vec2 oneStepLeftTextureCoordinate = vec2(xCoordinate, yCoordinate) - firstOffset;
    highp vec2 twoStepsLeftTextureCoordinate = vec2(xCoordinate, yCoordinate) - secondOffset;
    highp vec2 oneStepRightTextureCoordinate = vec2(xCoordinate, yCoordinate) + firstOffset;
    highp vec2 twoStepsRightTextureCoordinate = vec2(xCoordinate, yCoordinate) + secondOffset;
    
    lowp vec4 fragmentColor = texture2D(inputImageTexture, vec2(centerTextureCoordinate.x, centerTextureCoordinate.y)) * 0.2270270270;
    fragmentColor += texture2D(inputImageTexture, vec2(oneStepLeftTextureCoordinate.x, oneStepLeftTextureCoordinate.y)) * 0.3162162162;
    fragmentColor += texture2D(inputImageTexture, vec2(oneStepRightTextureCoordinate.x, oneStepRightTextureCoordinate.y)) * 0.3162162162;
    fragmentColor += texture2D(inputImageTexture, vec2(twoStepsLeftTextureCoordinate.x, twoStepsLeftTextureCoordinate.y)) * 0.0702702703;
    fragmentColor += texture2D(inputImageTexture, vec2(twoStepsRightTextureCoordinate.x, twoStepsRightTextureCoordinate.y)) * 0.0702702703;
    
    lowp vec4 blurColor = fragmentColor;
    
    // step1 ScreenBlending
    blurColor = 1.0 - ((1.0 - textureColor) * (1.0 - blurColor));
    blurColor =     clamp(blurColor, 0.0, 1.0);
    textureColor = (blurColor - textureColor) * 0.7 + textureColor;
    textureColor =  clamp(textureColor, 0.0, 1.0);
    
    // step2 OverlayBlending
    textureColor = OverlayBlendingVec4(textureColor, vec4(0.0, 0.0, 0.0, 1.0), 0.3);
    textureColor = clamp(textureColor, vec4(0.0, 0.0, 0.0, 1.0), vec4(1.0, 1.0, 1.0, 1.0));
    
    // step3 curve
    highp float redCurveValue = texture2D(curve, vec2(textureColor.r, 0.0)).r;
    highp float greenCurveValue = texture2D(curve, vec2(textureColor.g, 0.0)).g;
    highp float blueCurveValue = texture2D(curve, vec2(textureColor.b, 0.0)).b;
    
    // step4 curve
    redCurveValue = texture2D(curve, vec2(redCurveValue, 1.0)).r;
    greenCurveValue = texture2D(curve, vec2(greenCurveValue, 1.0)).r;
    blueCurveValue = texture2D(curve, vec2(blueCurveValue, 1.0)).r;
    
    // step5 level
    redCurveValue = texture2D(curve, vec2(redCurveValue, 1.0)).g;
    greenCurveValue = texture2D(curve, vec2(greenCurveValue, 1.0)).g;
    blueCurveValue = texture2D(curve, vec2(blueCurveValue, 1.0)).g;
    
    // step6 curve
    redCurveValue = texture2D(curve2, vec2(redCurveValue, 1.0)).r;
    greenCurveValue = texture2D(curve2, vec2(greenCurveValue, 1.0)).g;
    blueCurveValue = texture2D(curve2, vec2(blueCurveValue, 1.0)).b;
    
    // step7 curve
    redCurveValue = texture2D(curve, vec2(redCurveValue, 1.0)).b;
    greenCurveValue = texture2D(curve, vec2(greenCurveValue, 1.0)).b;
    
    blueCurveValue = texture2D(curve, vec2(blueCurveValue, 1.0)).b; 
    
    lowp vec4 BCSColor = vec4(redCurveValue, greenCurveValue, blueCurveValue, 1.0); 
    gl_FragColor =  vec4(BCSColor.r,BCSColor.g,BCSColor.b,1.0); 
}
);

