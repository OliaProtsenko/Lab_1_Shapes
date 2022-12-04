import 'constants.dart';
import 'model/circle.dart';
import 'model/ellipsis.dart';
import 'model/quadrangle.dart';
import 'model/shape.dart';
import 'model/triangle.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class FileManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String pathPart) async {
    final path = await _localPath;
    return File('$path/$pathPart');
  }

  Future<List<Shape>> readJson() async {
    final List<Shape> shapes = [];
    shapes.addAll(await _readTriangle());
    shapes.addAll(await _readQuadrangle());
    shapes.addAll(await _readCircles());
    shapes.addAll(await _readEllipsis());
    shapes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return shapes;
  }

  Future<List<Triangle>> _readTriangle() async {
    List<Triangle> _triangles = [];
    File _filePathTriangle = await _localFile(Constants.triangleFileName);
    final _fileExists = await _filePathTriangle.exists();
    if (_fileExists) {
      try {
        final _jsonTriangleString = await _filePathTriangle.readAsString();
        final triangles = jsonDecode(_jsonTriangleString);
        for (var item in triangles) {
          _triangles.add(Triangle.fromJson(item));
        }
      } catch (e) {
        print('Tried reading _file error: $e');
      }
    }
    return _triangles;
  }

  Future<List<Quadrangle>> _readQuadrangle() async {
    List<Quadrangle> _quadrangles = [];
    File _filePathQuadrangle = await _localFile(Constants.quadrangleFileName);
    final _fileExists = await _filePathQuadrangle.exists();
    if (_fileExists) {
      try {
        final _jsonQuadrangleString = await _filePathQuadrangle.readAsString();
        final quadrangles = jsonDecode(_jsonQuadrangleString);
        for (var item in quadrangles) {
          _quadrangles.add(Quadrangle.fromJson(item));
        }
      } catch (e) {
        // print('Tried reading _file error: $e');
      }
    }
    return _quadrangles;
  }

  Future<List<Ellipsis>> _readEllipsis() async {
    List<Ellipsis> _ellipsis = [];
    File _filePathEllipsis = await _localFile(Constants.ellipsisFileName);
    final _fileExists = await _filePathEllipsis.exists();
    if (_fileExists) {
      try {
        final _jsonEllipsisString = await _filePathEllipsis.readAsString();
        final ellipsis = jsonDecode(_jsonEllipsisString);
        for (var item in ellipsis) {
          _ellipsis.add(Ellipsis.fromJson(item));
        }
      } catch (e) {
        // print('Tried reading _file error: $e');
      }
    }
    return _ellipsis;
  }

  Future<List<Circle>> _readCircles() async {
    List<Circle> _circles = [];
    File _filePathCircles = await _localFile(Constants.circleFileName);
    final _fileExists = await _filePathCircles.exists();
    if (_fileExists) {
      try {
        final _jsonCircleString = await _filePathCircles.readAsString();
        final circle = jsonDecode(_jsonCircleString);
        for (var item in circle) {
          _circles.add(Circle.fromJson(item));
        }
      } catch (e) {
        // print('Tried reading _file error: $e');
      }
    }
    return _circles;
  }

  void writeJson(Shape shape) async {
    if (shape is Triangle) {
      final _triangles = await _readTriangle();
      _triangles.add(shape);
      final _jsonString = jsonEncode(_triangles);
      File _filePath = await _localFile(Constants.triangleFileName);
      _filePath.writeAsString(_jsonString);
    } else if (shape is Quadrangle) {
      final _quadrangles = await _readQuadrangle();
      _quadrangles.add(shape);
      final _jsonString = jsonEncode(_quadrangles);
      File _filePath = await _localFile(Constants.quadrangleFileName);
      _filePath.writeAsString(_jsonString);
    } else if (shape is Ellipsis) {
      final _ellipsis = await _readEllipsis();
      _ellipsis.add(shape);
      final _jsonString = jsonEncode(_ellipsis);
      File _filePath = await _localFile(Constants.ellipsisFileName);
      _filePath.writeAsString(_jsonString);
    } else if (shape is Circle) {
      final _circles = await _readCircles();
      _circles.add(shape);
      final _jsonString = jsonEncode(_circles);
      File _filePath = await _localFile(Constants.circleFileName);
      _filePath.writeAsString(_jsonString);
    }
  }
}
