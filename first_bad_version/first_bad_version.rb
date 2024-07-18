# The API isBadVersion is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad or not
# def isBadVersion(version)

def first_bad_version(n)
  left = 1
  right = n

  while left < right
    mid = left + (right - left) / 2

    if is_bad_version(mid)
      right = mid # The bad version is on the left side or is mid itself
    else
      left = mid + 1 # The bad version is on the right side
    end
  end

  left
end

RSpec.describe 'first_bad_version' do
  it 'returns the first bad version' do
    expect(first_bad_version(5)).to eq(4)
  end

  it 'returns the first bad version when only one version is bad' do
    expect(first_bad_version(10)).to eq(4)
  end
end