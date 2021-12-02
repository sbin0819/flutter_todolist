# 스케줄

## 1주차

- 화면 구성에 대한 와이어 프레임
- 투두리스트 작업에 필요한 스펙 정리
- todolist markup 시작

## 2주차

- db 연동
- 코드정리 및 추가 개선사항 추가

## 3주차 배포

- 배포

# git 관리

우선 참고

```js
module.exports = {
  types: [
    { value: ':sparkles: feat', name: '✨ feat:\tAdding a new feature' },
    { value: ':bug: fix', name: '🐛 fix:\tFixing a bug' },
    { value: ':memo: docs', name: '📝 docs:\tAdd or update documentation' },
    {
      value: ':lipstick: style',
      name: '💄 style:\tAdd or update styles, ui or ux',
    },
    {
      value: ':recycle: refactor',
      name: '♻️  refactor:\tCode change that neither fixes a bug nor adds a feature',
    },
    {
      value: ':zap: perf',
      name: '⚡️ perf:\tCode change that improves performance',
    },
    {
      value: ':white_check_mark: test',
      name: '✅ test:\tAdding tests cases',
    },
    {
      value: ':truck: chore',
      name: '🚚 chore:\tChanges to the build process or auxiliary tools\n\t\tand libraries such as documentation generation',
    },
    { value: ':rewind: revert', name: '⏪️ revert:\tRevert to a commit' },
    { value: ':construction: wip', name: '🚧 wip:\tWork in progress' },
    {
      value: ':construction_worker: build',
      name: '👷 build:\tAdd or update regards to build process',
    },
    {
      value: ':green_heart: ci',
      name: '💚 ci:\tAdd or update regards to build process',
    },
  ],

  scopes: [
    { name: 'ui' },
    { name: 'android' },
    { name: 'ios' },
    { name: 'home' },
    { name: 'planner' },
    { name: 'settings' },
  ],

  scopeOverrides: {
    fix: [
      { name: 'merge' },
      { name: 'style' },
      { name: 'test' },
      { name: 'hotfix' },
    ],
  },

  allowCustomScopes: true,
  allowBreakingChanges: ['feat', 'fix'],
  // skip any questions you want
  skipQuestions: ['body'],
  subjectLimit: 100,
};

```
