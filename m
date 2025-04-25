Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31961FE46D
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570721; cv=none; b=lmk12+lqjOxeh9IzSVMbMhWYAtFQmz6UQVBofeznCN8VyithuxqL2/VkUfeYir7NS9mYfjY7xxeUw+7j768PbnFWHbhz2JpOTDHUC0zkKCx+zhh32i+9WorYqBlH3dPN52nJ2CMUgb8gmDIGwh+AK5YIjFY8/i+wIzOpXQeDNL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570721; c=relaxed/simple;
	bh=CZqj5BJ+F9nGfuUzehgz/29o8eO2JwnSjCkRPFzqBFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JATirzKyoVtWhXRYxW9GgI55ksosxttNYXOin6PdH2R/wdXOD5/YPKIGdhihNaZ0EQjB8vtqv5jYDC/vnKnqsxrOheXX7ccZe/1wW6KvA1sqe5sq5h7nJjIDZ5jjmhtqdOSukNb4vh493TyS+K8dVMnWjUELB+S+TTCIDd4IAV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ck/dWddY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ck/dWddY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c33ac23edso18876295ad.0
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745570719; x=1746175519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLk1imrVTtrpJbWqDoaFAq9AHbfHxqAvYTRp4hVRDXA=;
        b=ck/dWddY4/S4Uz1+/xyjPk9/RZBpWDLhLjQw/uQIUlHR9PzAKRnHT29Y50sNAxuyt5
         4MdLP2o798sPupNh4moMxcCwdEyzlh3BdZpmnExv/TQ/DIYNmyPDhbqQuUc/61ZaUQmr
         WcXEYa4n7johY/J9KGLERiHetSSPPQLz+dT9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570719; x=1746175519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLk1imrVTtrpJbWqDoaFAq9AHbfHxqAvYTRp4hVRDXA=;
        b=uvNP5NjuQa+rCjEPnW95ZObxm4diePqRf3m7AM0zux8aRXAEHqYyJ6evyXhUo7bDmv
         5kW2Bc3tFi59S8WR6tqxo+eLP9G1C1IK9ULMwuAGzNkYiwECiUb17uVmQYkGOJOMAEIO
         cCdGg7D/C0yQB3PgvPKs67MZj3jX3r0IlnXp86FaY+/Vm5TpU641Pimz2/MLL2WS1RgV
         30y/kftULRojTVFzGGF/3bkBzaDuSKbK16lRvMelK99iTvnKQGALdmMBWjGIkG7eaqSl
         NdnK17GEMjVfRxKRu4imMc0hENwPrklpMWTQ1V95VaFmAuWJiUZv9esL9fBfm7HWAjQz
         rdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdxUy1VyslNAleXoU+MXTUIzczA8O865OmAFXvVrHyB29fET6djTOn81RD7BDqB39qse+1DI7p1h8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRZhZ1ICSPZdZveMSac8f+2ZG+QepZKY2eNu7qpld63RgQQBvw
	hEb4QBxB6OjdjkB0Tspk0PAzjdrh61OxFW43WP1Gvg+NaR6ibN3kao77LLrYRA==
X-Gm-Gg: ASbGncv3WksuJDIlnUXDZOW9UuCXhVTZyS3+pxabT/7R48QQKqBAU2hU4sSIUH7PaN7
	KsO9NQPv/Yb4FQy6LAaAnlg+bxiPHJfl2VVYmM1Hhe4wa+7GMJLwAPGDJ8Syh6lYprqnJ/xMzm3
	PUdJyxhQjAiNarFfLkJMFG7ogYZ58XU81rb3ofn1z2PJ0XBet0pHxRuhLPVekhy+2nhbgtM+6Wc
	sdfb6NWZxOugqQkWBtE6P2BXzVVCgDQVITu/bQ3FUGclvgJ+goF1fUQUELe1s5vXCkNxClTSRWC
	L4DwMx2G5Aew9DWY8Gg86yzaQ/sM+7YblPGEhrwzX78zqb3zO7TWrFA2Ukhb4dhITPhR76p98/t
	ILYSGc/Nn29+/Qok4/WJI
X-Google-Smtp-Source: AGHT+IHwtmtjweaqahg73jVCjpaBc/fqgd26dbxeV6NuU5ixsA45gOD/ynPh07Q3+NtHtBMv76H8gw==
X-Received: by 2002:a17:903:1aaf:b0:223:4bd6:3863 with SMTP id d9443c01a7336-22dbf4d51aamr24579845ad.10.1745570718748;
        Fri, 25 Apr 2025 01:45:18 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm26883665ad.190.2025.04.25.01.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:45:18 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v2 0/4] wifi: brcmfmac: external auth support for Infineon devices
Date: Fri, 25 Apr 2025 10:45:01 +0200
Message-ID: <20250425084505.491631-1-arend.vanspriel@broadcom.com>
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

