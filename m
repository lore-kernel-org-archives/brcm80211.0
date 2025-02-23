Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309914884F
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329127; cv=none; b=UwRX8ihnz9tgzHgswkzMQk8b+uFNIc5JjuNY91rk/yp0OuYziCoHNdzIFPFUAp/c6f1eDyhne0nX8AqnZ+o8Nx7lc7Te/Py01PyQgkuMRulzfplGcYTK/A/hilIqYJqt86EKzqXKvp/JANpVgTpSZaGY9yrE9jhKpx3fB//AQ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329127; c=relaxed/simple;
	bh=6rZCyADuBKXQMtzY8frtZm7r8BeFGku217x/vpm4MWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rxop20NNpPU8ixfZwn/UlNae0TyDyjd1mfIVYo0t5LCKzkGM4dE5lPfGgSvt8dKGQzkdKy1KxneYa6ouiHqTdqOVb67nQm9v1gU5fCCHZtI2oH4P123aYomEk8EBAjkT7fu/LoR6Bfvi5uwETNvNncxGYmoXBIILuyQGk3J+n40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1NxVP2O; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1NxVP2O"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220c665ef4cso61068695ad.3
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329125; x=1740933925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=G1NxVP2OWbWSWSPr0p+KbeqP8VZhIt0lMTpCeVY/Kb6LxY/R0ptPdO8s1qYgP9VDHC
         MpklB98kxgLj9ppXc/L4M6hfTRsrpyn7SxSVU15hbPwwWQP6ebnpfenzKhqs4jWdDi+R
         /hI7GnuW28TjN+KWaujHrJQQZKuqBF1Gp1PoXJcKziNyTNe78mWY4i0dd3MnRpxCxObh
         dElvS7CFYWvYNuXRB/wvXD2Xh/IEuK7hyf962gECX//KRlOQS8RamDhZvo6Y/X9MXxoX
         BogAs1/sq18zXl4ajCwaReNxN29OE4ScXYrHhsi8rLP+4MLHzUR+bXlstDU8RGSSgys4
         42YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329125; x=1740933925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=MtyxhPSiTTdXePsuMkdsz+IjtZcAw2pSbrcwLEW2uyKCKZWCcwz3UdDNHdLiD0fL9Z
         tg95M8w4f+OUdz1Vy1H7JGtu36WV/qRvOifVo5tNkkEPzNYxrXQzHmVU+g11p8irRZxf
         Vzd8ImpxuP3AqJAys/6Uw3/Aa2SPolmSDWjcc8N7K1g+f2LQtygwnwHakpJsdP17TupU
         jQUj07wJm/g9uCNLRvqAJ+HApIT/ZVDOtKM0LbbV8Stz6D+FJQBXy0SYr0d7UG3HtXnL
         /E4Hn0teemKUgO4OVQqepLgJAxM1s3QQ1evsbAn0Y2Q9X5fmZG+mvy7xvlviqs6iL/fU
         9wSw==
X-Forwarded-Encrypted: i=1; AJvYcCU/0ndJmuLk8hB5X3pWlyHAtk5hQcDmRK7uI4uTAUgMIuiTAt/tWrts3t0khjnnO0ZiuZ5iOfHstAQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ02hxqyn6OiCOO4jVMYYnQHaaXSOgbMLKJRbN52+hLvIwwGr1
	6bi436CBI0je+uTGxlhXN05TsQIk6+imNSjsgDsgTfpFS06e3DRk
X-Gm-Gg: ASbGncvA2+wnOx5juVpcknMqqXnOm8qpRcnwDT7fHYhGwPkyC7p7Rwpbn1eaBuybheF
	zOV42cHNdx7SE0PayVniTy6FCpXMRqWNQkuf5fwz0pUA1JBHQacs5aEA2X3wINPVIZO59UyHm4U
	acsjCvF66sau3XtqW3WCesk9l8rX+O0aS1XNfd5wRAilNWAhlrjNvxSv9lAq8siuU9KTKOEiSgy
	3+n/VMJUBdBLcap4kkgTxtG7T8X+z1jI3ADFJA4NDFQfPfnPkgTf8+yXxwkjCPMKYsY0eug8kqe
	V0YsAPtrA4CIfKP3f44l5ItSSlhuR6L81Vv3gtxFAOs1kXtRNU0M1t4C
X-Google-Smtp-Source: AGHT+IFs3TQ1rSxmmbPXVRsSl3rqDEDcDSV6UQtHXLRs1szh2ELiA6tHTHYs6po5Gu/F9oStBVoG9Q==
X-Received: by 2002:a17:90b:4fc9:b0:2ee:dd79:e046 with SMTP id 98e67ed59e1d1-2fce78a3738mr17084857a91.13.1740329124995;
        Sun, 23 Feb 2025 08:45:24 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:24 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 14/17] fsi: i2cr: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:14 +0800
Message-Id: <20250223164217.2139331-15-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..8212b99ab2f9 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,14 +39,7 @@ static const u8 i2cr_cfam[] = {
 
 static bool i2cr_check_parity32(u32 v, bool parity)
 {
-	u32 i;
-
-	for (i = 0; i < 32; ++i) {
-		if (v & (1u << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1

