Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9C1E4BE
	for <brcm80211@lists.linux.dev>; Sun, 15 Sep 2024 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726408874; cv=none; b=nMFs5VOT4Y26r0Tzzek6pMLCXOyFRPwt3WZ43ORODAhiDlDY5OZZClizgXHCQ2BK5gHMvt2RSemGGTU9d/JkEjhchfcWVxIXgnmP4IhcaLeBMKmsGRSC3YOdjHwEjzK2fSXUYn8RJacKIJq17ztBK6CjDu1IjJUn7C76zSTCSck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726408874; c=relaxed/simple;
	bh=a+0uL7m0OC2siKcEU3XeOFMt04QXcrLXRC1IKqOBsZI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MxP76ueg9xSVPoKKuGyLagt3sh4aJSLMaD74Aj64j6dx8I2AWKu+sd4W8XTdu7Yf02l46YqHSN2rLMJtCy1dGPzSaSMIoz5Dw/SE2lwMss8W+9P57Sm+brTCeXlfnGcXsQPRqHwQg50vJ8Sa+0Jm677DPIJvp7HRETF0+j9KF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XK1T2DVa; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XK1T2DVa"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7191df6b5f5so2550616b3a.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Sep 2024 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1726408872; x=1727013672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzjXCELMn5sAp75jFiBMFegVOo/PxDiQoVaRfxu8460=;
        b=XK1T2DVan1uZ/64uGynPUOwpXpjuD+s0ydsYI0XpiDm66KcvodUQIn/goqs3fyclrC
         vywHfRCWEzQjj2xJ3nAPjesvA/g4yuI+e49X9O5N6IhBwAs7dpzVs4JSUDhOu7paotVr
         y15BOv/RPCzVKiclUPV4qZbHDCTmP0SLwVCO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726408872; x=1727013672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzjXCELMn5sAp75jFiBMFegVOo/PxDiQoVaRfxu8460=;
        b=ONLvtZMaLGl6+Eg7dFudIAa+G/rOfSVMA4AqKkmRti9vjKU7rtuTbucMYPkOkl5hFQ
         mzFiPUqt0cZGMTP2X3bFuo5JNws9FS3O7efuLBoGS4cKdxCvU0obSqOhlkSRf4LjYofj
         vnBDgGtxNooyXOi1wls769PXp2y2Ukz5Fs122auSKiFb/+0y8rqVDePG3wE5+ShrWyVG
         tX/OKYJzylLEipBZmPcn+a39dgecoHtczdLNnxn/4ZDoS1g6BSsQkGd8zAY2D9xh+L22
         bdZMjra3JEYHN3rEUBXs4gIPsPB4JwDjr8mWTyCr0tkkIVzB2xV6KudaFeT1JoejJkD4
         ABvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkyNxRqy2qfGUkkFvolccSuNrdIULxVaRqC2qGS9s+xjU197+nZ+dFOBuMhSSR4cw2aL11TgEOQ8g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX3GQZs3DN0dd6vP3lrbwNAwxEMuuPO1wrI323vTf8ArvTq8nM
	neOLPySwJxx53rDor1TX2q/6wzkcxtvix5CvHxEjTZ37xGI+yvRO5Nt9/lweWA==
X-Google-Smtp-Source: AGHT+IGQxzsRD+xIYHyePMLG931w0ChJOtyukmJq2dUqPEjupy3TUcIYWpdNBMHO7RBtVPZIwGQC9Q==
X-Received: by 2002:a05:6a21:1698:b0:1d2:ba7c:d8cf with SMTP id adf61e73a8af0-1d2ba7cdebcmr4924670637.7.1726408871876;
        Sun, 15 Sep 2024 07:01:11 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab50d6sm2233511b3a.75.2024.09.15.07.01.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2024 07:01:11 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFT 0/3] brcmfmac: external auth support for Infineon devices
Date: Sun, 15 Sep 2024 16:00:46 +0200
Message-Id: <20240915140049.181380-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
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
external auth. Hence this is a request for testing for people who do
before submitting as formal patch series. Before testing the firmware
features can be checked through debugfs file 'fwcap' to assure the
'sae_ext' feature is present.

Arend van Spriel (3):
  wifi: brcmfmac: support per-vendor cfg80211 callbacks and firmware
    events
  wifi: brcmfmac: make per-vendor event map const
  wifi: brcmfmac: cyw: support external SAE authentication in station
    mode

 .../broadcom/brcm80211/brcmfmac/cfg80211.c    |  44 ++-
 .../broadcom/brcm80211/brcmfmac/cfg80211.h    |  25 ++
 .../broadcom/brcm80211/brcmfmac/common.c      |   1 +
 .../broadcom/brcm80211/brcmfmac/core.c        |   2 +
 .../broadcom/brcm80211/brcmfmac/cyw/core.c    | 308 ++++++++++++++++++
 .../brcm80211/brcmfmac/cyw/fwil_types.h       |  84 +++++
 .../broadcom/brcm80211/brcmfmac/feature.c     |   3 +-
 .../broadcom/brcm80211/brcmfmac/feature.h     |   4 +-
 .../broadcom/brcm80211/brcmfmac/fweh.c        |   7 +-
 .../broadcom/brcm80211/brcmfmac/fweh.h        |   8 +-
 .../broadcom/brcm80211/brcmfmac/fwvid.h       |  29 ++
 11 files changed, 492 insertions(+), 23 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h


base-commit: 34c44eb31de9cb7202ff070900463d6c706392c4
-- 
2.32.0

