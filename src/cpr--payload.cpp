#include "cpr/payload.h"

#include <initializer_list>
#include <string>

#include "cpr/util.h"

namespace cpr {

Payload::Payload(const std::initializer_list<Pair>& pairs) {
    for (const auto& pair : pairs) {
        if (!content.empty()) {
            content += "&";
        }
        auto escaped = cpr::util::urlEncode(pair.value);
        content += pair.key + "=" + escaped;
    }
}

Payload::Payload(const std::string& data) {
  content += data;
}

} // namespace cpr
