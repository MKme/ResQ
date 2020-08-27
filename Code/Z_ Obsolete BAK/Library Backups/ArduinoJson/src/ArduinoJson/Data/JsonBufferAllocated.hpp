// ArduinoJson - arduinojson.org
// Copyright Benoit Blanchon 2014-2019
// MIT License

#pragma once

#include "../JsonBuffer.hpp"

namespace ArduinoJson {
namespace Internals {

class JsonBufferAllocated {
 public:
  void *operator new(size_t n, JsonBuffer *jsonBuffer) throw() {
    if (!jsonBuffer) return NULL;
    return jsonBuffer->alloc(n);
  }

  void operator delete(void *, JsonBuffer *)throw();
};
}  // namespace Internals
}  // namespace ArduinoJson
