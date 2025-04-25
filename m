Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3949236435
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571329; cv=none; b=i1q9/pU8s51uEKypU+7ne+u4gu7kiq++aUtXH+jnwQ71MzeXX1D/KQxDAaExlNPDwGHTNNphVswhxsGZXxFA3o3KmJcu9kw5iWbYlaiXmU3CjnoXzIm1pixP44kQi5TG9/a4fC4/hEEyszGih145oBwfx05HkqBx2RlvYtzovDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571329; c=relaxed/simple;
	bh=CZqj5BJ+F9nGfuUzehgz/29o8eO2JwnSjCkRPFzqBFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHZNrKHcRwVIqM8wOIV5FOzZeH/O7rIGscJzLsStLZsmA5e6ExelfaZklTTdBnh/DqkXLGyz6QfIHrbXHsbBsMD1souQVr9n1E75P3fbg3bqHJ9k//AnGA/6JjymgfuZJcgNhbE1Po/3ulyDAYj9KRZA1rVv+ndx0enX3SJVtd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fdyL65SB; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fdyL65SB"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c336fcdaaso23853485ad.3
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745571327; x=1746176127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLk1imrVTtrpJbWqDoaFAq9AHbfHxqAvYTRp4hVRDXA=;
        b=fdyL65SBF/SirVq5oyWM2g9ZkDlHDjsJ3HipmnyksfiHWsUkMNoc20t92VZupup++K
         Kf7P8QhV/ArSMWIDZbhB5HWiUjWeXFQbyma6fHQPYhF2wqLywx9XJ/4bsmy784xflQ3X
         V8WSXnxfY5eW1xrE3wpDtrfL36DpnspphNI0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571327; x=1746176127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLk1imrVTtrpJbWqDoaFAq9AHbfHxqAvYTRp4hVRDXA=;
        b=BgQ3VAIUD+dkdb4nqk4lPxLQd+yz8Dqve3rA7PGgR21a6FWfTbjziA9g35kr0Myds7
         Ox8nQuYIDUAeRvoS4pvBQUU/DPvpsN4bxFp3PfaVqC1mNfzd05Bnq/+VGo5u6zZRTIc0
         cFEqW/8xNy45XTPiLvModRvyJ6AFYeGQiREYyyHxTr7ttnIQ5TtSROiS4CsR4mKLQo8o
         waegwliAULop20DLIXqZPBjjjRrjZWVOU07KRaEhaB7fdlC6fjaP0l5V12nsR+jcxq1W
         AW8OP3c7Ncx/veNb1ZhHbMp1ne5Wz41CsEhs+FFLBQS5F7R4QS+lX4USEXYoBEPoUcfl
         VJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXNEuXKuWkESGlrF0rD0qIuQOORW0q+3yDyws3I2gkGxrZVOE3UhKc0Mdh9VATKDLTlFDiKaYCOck=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZU42JaA5CdXUgs3R7ZHwdpcTssS5gI2HxQqWepi4jRJGRu3qs
	9PeHe1QB3pcu7Lnvwud83e3B5aFmng0ZVwWQYmJCkqxP9loaZQFL0Mfg8BL37Q==
X-Gm-Gg: ASbGncsvqxgGJNEZ7j4UlBeJGjq0HnNZ0fFFSJ0GUCUS+kYM9/urptlRmuUr77/9f3v
	3IbRfZirUrUWiwIBKy5J/vYLIFcDriFfLuMtIRL7AFj6ZyAnqAez6MRTun/Uqbrmbf+x51rzk8Y
	kxnINHjZ4Fdyk2beezMDYqIvHzZ3GRQJLiaz4BLd0QFDQs9HLncwPCYelWoMFoqt/m412pN1Ctr
	R3T+4vYCvMilvOPLLM5GnoZOl/VGMpV7mMCrfV/ERRIZ/V4sRQzlJdn6pBasiRgoGU5xd1OzWcN
	2Ja0wmCARailGIvsMdSNx1D1JEGVw/NeBUd/YJmAdSyr2yrWEydbmXnNZK6oStWQrqlJnT4haw5
	zQ2Ru/6844dqoRB/oZm40
X-Google-Smtp-Source: AGHT+IHvNj+T2miyitTkiebT3bjTMSSX+lRizAHiFK/yIBbZAuVf2umZ3kbZIa/T/tDWcP8+Au49xg==
X-Received: by 2002:a17:902:ce12:b0:227:e74a:a066 with SMTP id d9443c01a7336-22dbf5f4cf0mr26479535ad.28.1745571327036;
        Fri, 25 Apr 2025 01:55:27 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221943sm26988875ad.249.2025.04.25.01.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:55:26 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth support for Infineon devices
Date: Fri, 25 Apr 2025 10:55:15 +0200
Message-ID: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Infineon chips support external authentication in station mode when
firmware advertises it. The feature that must be present in firmware is
sae_ext. This has been ported from Infineon repository and makes use of
the per-vendor framework. It showcases how things can be organized per
vendor to provide the functionality.

Unfortunately, I have no Infineon device and firmware that makes use of
external auth. This series was submitted earlier as RFT and it was tested
successfully by James Prestwood with iwd after adding a fourth patch to
the series. I would not mind if more testing is done with this series
like using wpa_supplicant instead of iwd.

Arend van Spriel (3):
  wifi: brcmfmac: support per-vendor cfg80211 callbacks and firmware
    events
  wifi: brcmfmac: make per-vendor event map const
  wifi: brcmfmac: cyw: support external SAE authentication in station
    mode

Ting-Ying Li (1):
  wifi: brcmfmac: Fix structure size for WPA3 external SAE

 .../broadcom/brcm80211/brcmfmac/cfg80211.c    |  44 ++-
 .../broadcom/brcm80211/brcmfmac/cfg80211.h    |  25 ++
 .../broadcom/brcm80211/brcmfmac/common.c      |   1 +
 .../broadcom/brcm80211/brcmfmac/core.c        |   2 +
 .../broadcom/brcm80211/brcmfmac/cyw/core.c    | 308 ++++++++++++++++++
 .../brcm80211/brcmfmac/cyw/fwil_types.h       |  87 +++++
 .../broadcom/brcm80211/brcmfmac/feature.c     |   3 +-
 .../broadcom/brcm80211/brcmfmac/feature.h     |   4 +-
 .../broadcom/brcm80211/brcmfmac/fweh.c        |   7 +-
 .../broadcom/brcm80211/brcmfmac/fweh.h        |   8 +-
 .../broadcom/brcm80211/brcmfmac/fwvid.h       |  29 ++
 11 files changed, 495 insertions(+), 23 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h


base-commit: f600832794c91d7021d7337104734246b02a2b86
-- 
2.43.5

