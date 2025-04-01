Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829C2046B4
	for <brcm80211@lists.linux.dev>; Tue,  1 Apr 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516578; cv=none; b=a5fPS3z+IZbAPDawNCUjW7G5c6kYcJ8/qqDxKFozEA7cXyPrhbsx51HBXqN6B+PfPXHRNLLSuHTH+/mPogDoYIeqNmsnBY0jH65uh4DGAvfUbSPKJtNWkq+k/Ll1Um3cobziIKmpWOFvGD6NQ96gMt4Qph3IFs0rbkqBr+Chlaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516578; c=relaxed/simple;
	bh=My+IhUJPDIGC/U42rriDITzfwFXpKC6Yxi6GLAVN7H0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sGz0MMmjNaCpRcHu3Z4MRIB/yOrNXLHSda5DtRSHCr/SYvfUqDx3EgI+O49Kos4lWFatbOUCJFByWfJJhq46ApIdclVXWq3xpE32t2uasvv2tVFJY9ib0ytUsJyCV0XcBFpinpsiaxg7j+B+D6BMuV3rQ15fOTnXZoSoAtVnpDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ey6x+ktL; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ey6x+ktL"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-22928d629faso69146025ad.3
        for <brcm80211@lists.linux.dev>; Tue, 01 Apr 2025 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743516576; x=1744121376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a9GlRWIrROmsrWYyZDpS+4LIE3y91EaJxNh6RKPsNwg=;
        b=ey6x+ktLkc9RW4tGFpwk1ThGaKpHvxO3bftDM6nwXfMcHSiiPmUHYzd2oZR+7IHNqh
         SMz5KpEzQtmzZ9tWXOK1OhAXybke9yIe2LWCDcmqIHAzQa0XqEJfap3N6lxY0NMZHyX2
         URC7I8sFBzux+4pMdzi8EslRwHvqBhS4VIAsDE2sfTBiVEl2YZCWD17c8n/AnMGR4IHZ
         bOaqWgsY8QdO68r0psDb0k+6E5k7L9+dbLQS2cGcIPzV8R1fBJ9uwNBpRfS49u+HPO0i
         tc/sRCFjzlfbLkrvMDavftbHW4uM42wzGj+ibLbmdUXkspCqVXFrdpm1mRliYmjGq4yK
         YOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516576; x=1744121376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9GlRWIrROmsrWYyZDpS+4LIE3y91EaJxNh6RKPsNwg=;
        b=K5LSWUjKDcj0FzZpWl0Lflv7SAR9UxYaYDYvcIwAfx8M8oa1BEcVsrdRKmSc01RQTF
         azQhCmpDqnV1A23F1lqDqzkuuM+Na8E9yI1spJtwi5uUY3HXhBLkGQhDdK5uL/X1h6lH
         9hfXmHJN6XcToRb9VA4s5DOpLcgFG18G389y77d780+OCr41upu1xpvk71/gLQ9VpVVD
         Ezpys0AUoMRttrfnnJz2+5jd16oWnoYdbwp0l0i8F4zcYxl9Rv8G+Wa/4M5oY8C31RhT
         Ia9hGVwVPs96rq1+UCdR13N+8/QqoUk6pwlmDxmSBbt0trZ/XAjEiGxPTyPblxSvke2A
         URRg==
X-Forwarded-Encrypted: i=1; AJvYcCVR8bQrntEClJvOSM/UkyfOy0BRzHYxX3cSif0TFY6dmFEZnuH73w4TFg4ttNQTHjg71phqjj2+nzc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyryOc//OCHZ7FEF1RAZ81vikLRj82D4V1wGADBHu3aY44gpH6I
	nBaLeTtOqXAKNUjhLXqwXLqO8/zRHQ4E8URerPEIH6yHe0AKv0RY
X-Gm-Gg: ASbGncszphEckLGuZHVMt/1VhsseRip2cSUg7YkzRA2bPR8PacwCmliptuLX/745d4y
	h0obGqURVUnhHioKrO6cX8Z+QIqKMS2wZ4nxMBWFTE6qLuWK9mBa5P4XAHI4fibHNfXzAaT8m40
	70u9/WiI2rwLPPUvb5DrvZns0olpkXlWZgxzeqWVZelqrrG05W0pxk3wASciwfledClR32Lpn6J
	hzr7L0TnvJ32H0XcNMsccw8zTYKy0hzqYwA5diFwP6784jXPICX7OmMPu+Igs/+bTyEyCaO5CBU
	j3AzpqdRgVAgC2J4eI/Hm/eBCtjXEOZx8kkQBpmJEv6l7zhs3NDjwIy4Am+zZJ3NJBpMoFQ=
X-Google-Smtp-Source: AGHT+IFgauv64PUqSz27wL93wQDQRU2fSOWY7nWrgsuD8SQDOPwlyH8YGEfCl2nmEhWzzN5QGC28OQ==
X-Received: by 2002:a05:6a20:3953:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-2009f5fe141mr19082242637.15.1743516575790;
        Tue, 01 Apr 2025 07:09:35 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b6d82f2sm8082168a12.40.2025.04.01.07.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:09:35 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] wifi: brcmfmac: acpi: Add NULL check in brcmf_acpi_probe()
Date: Tue,  1 Apr 2025 22:09:24 +0800
Message-Id: <20250401140924.29168-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
brcmf_acpi_probe() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 0f485805d008 ("wifi: brcmfmac: acpi: Add support for fetching Apple ACPI properties")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c
index c4a54861bfb4..4885d5d0a0af 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c
@@ -25,6 +25,8 @@ void brcmf_acpi_probe(struct device *dev, enum brcmf_bus_type bus_type,
 		settings->board_type = devm_kasprintf(dev, GFP_KERNEL,
 						      "apple,%s",
 						      o->string.pointer);
+		if (!settings->board_type)
+			return -ENOMEM;
 	} else {
 		brcmf_dbg(INFO, "No ACPI module-instance\n");
 		return;
-- 
2.34.1

