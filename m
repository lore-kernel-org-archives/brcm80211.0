Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5233F27FD56
	for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523798; cv=none; b=TNacPcFzj+ipfGTSPkwkDqu+FIGNyIfiV4dCWAYkwGsLCEJM9k4KjDDS00XcVD0X09YOH20/J5z5z3ctE4eRMRVnFdZv0kIZMKpYv3IZWHOGnISn0T4qc1sqVeosdNmLQxQfsjhfTpzfGPHfs+upBqgV3S5rXXMNXffaxCPR5/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523798; c=relaxed/simple;
	bh=ErYSPwOz6O1h3Xq7EONqPMLC/tP5M2SYPzNTnwZrGZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YloDUoOIdeWf7F1IFvsAH8ciNk9QXYbH7O7hrgDPr7p8/6UxA+jWnZflvTJs3rxLdtCJwLPb3fHYirpfu2HCe4lHVXn1HEhi7ULuq4PS1r0QxjZFebuCYMp+5X2zkv4zJGawg7ZjcrjU1nNgUWxWUxfcEVxLmr0jajmrvlE+o/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ELzjTtXk; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ELzjTtXk"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739be717eddso1089086b3a.2
        for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 12:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745523796; x=1746128596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09Nc3tIrHFo1lVvdAoNoDKUuFY4GjCcbKUCXS9iSSak=;
        b=ELzjTtXkmjQ/bIoXMK4rf31KY2V7CBar9rfCGCkZeIxzAQrqJ3NbEtj5WI1ZnVqxBl
         MtzXa+CvAMr0jybQelcvT2eIWiQJjSHp0dRUN1cQkUsoeGTArb4/p80v/NQIvuoRQ4Zv
         K+CPQfrdpZ3ybXyMTd9tUo7xHDdVSBO5f4rPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745523796; x=1746128596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09Nc3tIrHFo1lVvdAoNoDKUuFY4GjCcbKUCXS9iSSak=;
        b=XESmJbl9NPLZe4P5nSCCzMvbjEfjcn822lX9f7eum6oOvziipw84eyZX74Fj9JhiZf
         nHrTyK5T3wEaX4kA4aJU0OtIvQ0JLTAAyWTa5jVNTBmrhiYBg0sspoU3nWQm51pvJxme
         j4GRdqhQgAZDqvlANZtdDT3zQZc0x1VZx4B1Vua0UxoCrSPIfv3sCO237SUOXFma0WE5
         zu98bo0INLobiswSMC2pK62TMLQkjY7RgA+vT7/o2v+Ir1wRztkB0F+WrGRRW6eTg1sd
         tTH2XB5TJNuRQtr7WH+T15IJAGPln5i7JW55tu0I4hklJuZ/23vdtsu53YdvDnlzqezV
         qEdg==
X-Forwarded-Encrypted: i=1; AJvYcCUL/xI07/nPfj/9sqO9/g9C+YfRuZH3OxAfR6SjVsnk/GOowlHwlcg8I//QR0hPJl7LT21kZhJEyTg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9SlD+jyNZrVsiiIpsowqBzBCK1wAL6YWnBjgtZkB4CpRzD2O8
	pc1lS3Y1DXgoRMHvS2agRM8GrXFxbcpxrVE5nYj/poetOAI1C/1wb2LfuRXYkA==
X-Gm-Gg: ASbGncuMcbgueoX/tdWdRbIw4JQXVkiLrX4XKGqANPYKezasLF0D11o4Oz2iObHlVcA
	RqpIfF72gK5v1TeXdsY2zcSzbWRFKECZzMpdWoSiMsmhIMViQC3hvBdib5ye3VJnHD3J0zQNs/Y
	TAntttMIgJTPOAvp/7HEZUOQLSpskBBpDPcya/z1fzBM00cogHpDPXjIptMd8H3NkhNZHVkUh2f
	E8OA/hDnoauFmIsWjfgBF3xctDbjdYiH8HHClsmU/fo99h+VIM2gw8iyDJzFJujZwN8OUySsPjU
	6Ihfxw1olhrIeQLZyY/RFvQLNR342W0AJCYj+fW574cpIpUav4fXVOZ+qxXOJmi7K0pP59Ia6QJ
	g05VSzcI6FrLmOh5Vv8xU
X-Google-Smtp-Source: AGHT+IFZ1fuNTtCsgLtZ8ahNt7OEXZnO7lMzp+NeH6ehKDBIiSJeErS3Cujn6shcO9NGgPkP+iuxIg==
X-Received: by 2002:a05:6a00:8087:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73e24afd361mr5470215b3a.20.1745523796474;
        Thu, 24 Apr 2025 12:43:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6aa52sm1863494b3a.94.2025.04.24.12.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:43:15 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next 0/4] wifi: brcmfmac: external auth support for Infineon devices
Date: Thu, 24 Apr 2025 21:42:35 +0200
Message-ID: <20250424194239.2825830-1-arend.vanspriel@broadcom.com>
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
 .../brcm80211/brcmfmac/cyw/fwil_types.h       |  85 +++++
 .../broadcom/brcm80211/brcmfmac/feature.c     |   3 +-
 .../broadcom/brcm80211/brcmfmac/feature.h     |   4 +-
 .../broadcom/brcm80211/brcmfmac/fweh.c        |   7 +-
 .../broadcom/brcm80211/brcmfmac/fweh.h        |   8 +-
 .../broadcom/brcm80211/brcmfmac/fwvid.h       |  29 ++
 11 files changed, 493 insertions(+), 23 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h


base-commit: f600832794c91d7021d7337104734246b02a2b86
--
2.43.5

