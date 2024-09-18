Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FA61AD410
	for <brcm80211@lists.linux.dev>; Wed, 18 Sep 2024 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726686685; cv=none; b=LC4pHbPQh+4JMLlHqcLFJIo8om5Ae/be0FhLviEm3FCVjv/JcxOZknZnS/7kjXJDJo+NGr981BHFK3fdJAX2KfcCKF7WjP1xmhWODl31Q/Wh4KgEcTT+6hx+QQTrRKA6xrtM4Ytw6mnD/FaqnC/cqunJLq7t4j1cdMYgVvy7Gvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726686685; c=relaxed/simple;
	bh=YlDlfO6oppdnTcmtFzD9lV7M+eeempLwE8HAxjK3sdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e7s9AitZv/Pu6+tTMT1ZcmOCWBFbA4CwxtjXWrxyucuR211R3rO6oGyKsmPvfxL22yuyccLmGdxpkGPOa/mu/TBqHnguKaQ5lnY7GXHyM8ghvE2MSflqglnm+lWQmLRVIybV76pvTU7tIiUWveyihjwLbhFMjtZpEdFnDC33Qqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XhSY1j0Q; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XhSY1j0Q"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a9ab8e5f96so4465785a.1
        for <brcm80211@lists.linux.dev>; Wed, 18 Sep 2024 12:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1726686682; x=1727291482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBXNIld191O5zyOjokQ7vQg2NF4PyRalW9pITb/4A5Y=;
        b=XhSY1j0QBeA9unMCoNC/kuIQH0Bubr9DYpeJOb/7URuFO73ss08qkRpN3YfLsKVCBu
         NLmom8gH1js4tQRQB/GJclI/miHaDEZ595aM3AYwW5N2bJrVPp7Q2Gq9CQBlxCVKBRk/
         I9zommf72lp+DcR9t019jGCGMavyzWjWY60gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726686682; x=1727291482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBXNIld191O5zyOjokQ7vQg2NF4PyRalW9pITb/4A5Y=;
        b=Z73nG8RQ/98755Xx0UXTh1y1vpXmN1R+PkSFuEjA8+h2B+QwoGk1wP5IolSzYc7I2G
         9xX2g+LB5Ucg7bJLrMu+yW3bUng7W9ggixx0gst9t6dAJ28Ny192sn9HQYhYnbS/WDfa
         G3OgLTIIVHCO7P7aginnkQqN8C6Gg2wKOHUAXIIh9GMNDjVcMT5rFMlNOQtAQB0I5vUG
         c6nDNjVlcpp/G+FL8an4eqKQcoGHOmyR8i2BzCtzqSDoQEEwXexLpNTIMUR8/zXeME3T
         87cwhwWBidQbpk72hfG+sC/sC5OEkHR8dnzgNDM3RAuXMZly1Fag8TzT/vmiz6zxmJVD
         cMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEbkYVCDeGHVnYUn06G8R5AILxL7+wb7zHXtXJJssDNJwfMcYge6PO8mttdTtQWkCHq6A3vdHHQf8=@lists.linux.dev
X-Gm-Message-State: AOJu0YymwG6IaeBiXiK4/u9dD4Wl3ItB21X5bgQYz0ja7aHIB8G0F6XY
	HLltKYsQOz00zJIVuu36PfaMY40ZYVTrBB9vh9ESa5ybi7MdDIIPlLE8MsYRGw==
X-Google-Smtp-Source: AGHT+IFytGm5v3MrxD8tbpqwSaaQU2+s/Ep8l2Re0UgFKnBOHSFmvMoYFLxSQLKhEV5P/YQMsaGEww==
X-Received: by 2002:a05:620a:400b:b0:7a7:fef9:f608 with SMTP id af79cd13be357-7a9e5f878c3mr3488019685a.52.1726686681705;
        Wed, 18 Sep 2024 12:11:21 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08dae51sm2275885a.122.2024.09.18.12.11.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2024 12:11:21 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFT v2 0/3] brcmfmac: external auth support for Infineon devices
Date: Wed, 18 Sep 2024 21:11:06 +0200
Message-Id: <20240918191109.41960-1-arend.vanspriel@broadcom.com>
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

Changes:
  v2:
	- address build issue reported by <lkp@intel.com>

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


base-commit: 5a4d42c1688c88f3be6aef46b0ea6c32694cd2b8
-- 
2.32.0

