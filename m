Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D148214813
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755457495; cv=none; b=o/pHJubAaP7vuOBTbLeSYijXJh2yWWEEFwWBC+JMyD+t3uVB/e0PZY68msqHuKPGhxvRRMvZoCIJ1lxPjJyu4T6JBF7YVIhjac3qvZ9YY639jfmtr8Ar/sxa208WgG7gZ/EUJxa9uaaAsE2H7XIpms4kpKH3T7gRw99/dQUNDC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755457495; c=relaxed/simple;
	bh=jwzphG+Az96Vdglwlj/nfJWwr5JXfZ64zxuJLYyJXzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/tkey/AVTzfSGNDwTcD3eu8cy+atHs3TeZ0xSPs9lSUsaFlul5NKa5c7Jg4vJJxfLjJRCif52zlNfEkdkxOPWBMN7nrBFWrsxk9hQi3n23qpWTXJtv9/5O8+B8kRe1tVAHirsg1dtyYEftusdGS2RivkqRSKDpEJMzroqY38FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UrN4hZJq; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UrN4hZJq"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b109bcceb9so42156901cf.2
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755457492; x=1756062292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stkdniq3T479U2/HC4Jl2YCOaNORwWoeYv674Y4LHh8=;
        b=UrN4hZJqgj1WKGXo0ClrojtLLOJOiU0fI1mXE6Pz5u/szIpoUczrstR98hHJiB8NFD
         Tnf+/9lBAtixu3I+G5SkEeIAPZLKwhgYSgNaowTwvSe0dFkqHPY2UlrQW7eSYaMRcIau
         VXQkQqZti/1YQoSELTLbSP7F3xMFlsfattdVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755457492; x=1756062292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stkdniq3T479U2/HC4Jl2YCOaNORwWoeYv674Y4LHh8=;
        b=sjGRmKZnYymxLLCW/RdFwzWwRexHHSNCKrbY8WL3HwhnSEaBLom8NDCInZAOX/3u1d
         kuWKLfz71d6PMq9xUsOnjUbUmf8nrA1TybMp5Dj3aWN6daAkhFQBwdespSH6PAtzPR1o
         0llQbyxi3ppXoe/Qb4Vtu40rg62ZkSbcoKDJyJR5hKdFXvRT+NHxLK55rv1YLF1q11OB
         V+5m6Jr/3vzZYRT8GReWEaX/5E9/o9+9XwyM011bkDUTAWsR+LxbX88321tIfE1qKIkR
         JvkMCkOmQO4NV0IXu/21wPO1vOxNeOD8yoFH8/Wxy1arQZo9uliJxb1D+Vh0K79X7V1P
         1JAw==
X-Forwarded-Encrypted: i=1; AJvYcCUZmCgpNO1keXeImv0M8OPhTd3OQPC+PhprNNIk+lPulY0nwPOrR0j2Hslz2VdLcJBc59FwXSAtQGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMTFQXIXCUVrx4zfDQC5vLExW/T9s1bP5d5HDPx5rGnnaR4t1O
	VDc4ONsSqKDmzw89uLkAV89mnA53slIe8T8IWdFTRNQP97C99VVWhZ1VIA6/43SGXfHzhFI1+QX
	F1JbtsQ3d
X-Gm-Gg: ASbGncsU+xSIWdlFIDL/20onVt/JN7krAmNWc4n5skj7BJtRH4d0kkxFUvEcb90xvKL
	OXtfeI937KAdC0umDtWINLyIXwWFOa9VgGLw057lq24DITX8WaT84CVtuUwfWAr1CzjfWiQgEOA
	FYkv/NR/gFboIGiGQhpKfKBCyi5DtVVu1Ks+NvzRBL+AQPqaLFzS3YOiwRPNPjfmkT9gUaOGk7X
	nPI2l1QqAMJ4SgSwXv1AzykJKy3ihB/066Uabhik3GKsyZhXAKRVOrRe6GyKCJQmJA9546fHqLD
	MMog7B+9cg+PcXm5ol+xYlaa2udwPvBxcXzksFgvXjHwdlfsXhKpWLOYjVEevWKjnryy0wHSjIA
	T8yJWkl63Ug8RaejQmjAjWvx7DhM1ombicM1B2ww3Nn4YfO1piMoQGTOleIGjqpSdyz8HRU9U2E
	e9HQ==
X-Google-Smtp-Source: AGHT+IETavnthNhCzGCss+welECI8tYBDm3EH1B8GP392KksVfDAaovV7zH0zBxr19zj7pQPRNCruw==
X-Received: by 2002:ac8:5cd1:0:b0:4ab:4d30:564f with SMTP id d75a77b69052e-4b11e2c486amr161485611cf.47.1755457492133;
        Sun, 17 Aug 2025 12:04:52 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de50b31sm40382461cf.51.2025.08.17.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 12:04:51 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v2 0/4] wifi: changes for NL80211_CMD_SET_BSS support
Date: Sun, 17 Aug 2025 21:04:31 +0200
Message-ID: <20250817190435.1495094-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here a series with my idea on how to solve the fact that drivers may not
support or handle all parameters contained in NL80211_CMD_SET_BSS message
as sent by user-space. The driver can announce in the wiphy info which
parameters it supports and user-space can indicate that the kernel may
enforce strict checking for the NL80211_CMD_SET_BSS.

Arend van Spriel (3):
  wifi: nl80211: allow drivers to support subset of NL80211_CMD_SET_BSS
  wifi: drivers; indicate support for attributes in NL80211_CMD_SET_BSS
  wifi: nl80211: strict checking attributes for NL80211_CMD_SET_BSS

Wright Feng (1):
  wifi: brcmfmac: support AP isolation to restrict reachability between
    stations

 drivers/net/wireless/ath/wil6210/cfg80211.c   |  1 +
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 23 +++++
 .../wireless/microchip/wilc1000/cfg80211.c    |  7 --
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 --
 include/net/cfg80211.h                        | 29 ++++++
 include/uapi/linux/nl80211.h                  |  7 ++
 net/mac80211/main.c                           |  8 ++
 net/wireless/core.c                           |  9 ++
 net/wireless/nl80211.c                        | 89 +++++++++++++++++--
 9 files changed, 158 insertions(+), 23 deletions(-)


base-commit: d9104cec3e8fe4b458b74709853231385779001f
-- 
2.43.5

