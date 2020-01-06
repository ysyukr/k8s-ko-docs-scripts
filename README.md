# kubernetes-ko-docs-scripts
쿠버네티스 문서 유지 보수에 도움이 되는 스크립트입니다.
This script helps maintain Kubernetes docs.

## 스크립트 이름과 용도/Script Name and Purpose

* docs_link-chk.sh
> 선택한 최근 주차 이내에 `contents/ko` 폴더 하위에 추가된 신규 문서를 확인합니다.
> 확인된 신규 문서의 원문으로 연결하는 링크를 가진 기존 문서를 찾아내어 목록과 라인을 보여줍니다.

> Check for new docs added under the `contents/ko` folder within the last selected parking.
> Find an existing docs with a link to the original text of a new docs that has been identified and display the list and lines.

* outdated-chk.sh
> 선택한 이전 브랜치와 현행 브랜치 사이에 업데이트된 원문(en)을 확인합니다.
> 확인한 원문 목록과 한글로 번역된 문서 목록을 비교해서 업데이트를 해야 하는 한글 문서의 목록을 보여줍니다.

> Check the updated docs(en) selected between the previous branch and the current branch.
> The list of Korean docs that need to be updated is displayed by comparing the original list with the list of Korean translated docs.

### 쿠버네티스 현지화에 대한 기여 방법 안내([GitHub - Kubernetes/website/README-ko](https://github.com/kubernetes/website/blob/master/README-ko.md))

`README.md` 번역 및 한국어 기여자를 위한 보다 자세한 가이드를 [한국어 README](https://github.com/kubernetes/website/blob/master/README-ko.md) 페이지 혹은 [쿠버네티스 문서 한글화 가이드](https://kubernetes.io/ko/docs/contribute/localization_ko/)에서 살펴봅니다.

한국어 번역 메인테이너에게 다음을 통해 연락 가능합니다.

* 이덕준 ([GitHub - @gochist](https://github.com/gochist))
* [Slack channel](https://kubernetes.slack.com/messages/kubernetes-docs-ko)

### 초간단 쿠버네티스 문서 한글화 시작 가이드([GitHub - @jmyung](https://github.com/jmyung))
- YouTube: https://www.youtube.com/watch?v=OTl8HBjxIhc
- 가이드: https://github.com/jmyung/how2contribute-k8sdoc
