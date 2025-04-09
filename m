Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012C26A1C8
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213617; cv=none; b=QUVgBZ5EyjB+gO5M/WMj2PXsQr+YZEOD5SHXsFTcmuO8y0BZqIu8lQMO2OohsJV9V7cVc/1mk1D6Vy/6DPa/F7YPCc3UsmlJHi/por+AYNCOFe2SP72d8RF0Yfn6wMMijJVBmKrDOUQyyBzsnnkKWfWyf8xOfZORpQypJovdJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213617; c=relaxed/simple;
	bh=X8Vvsxqf+8EVtFmpaknjrToXsmDQI1ClPOYdeJUSaXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jjYJiTKBh3NcfmapDDOo8BOAA8c5sTaKTHmWqxxRykXkZc0nJTpQVz5/LcvQHOzLCD45i/hMv+splIVlQxg5AXbblZ4XpIcN2TM1WCVr/Dlbk2Pa1SGih9V3+mzM2Im25ZsWVmnzJ66BAh3nlndXnuvKoa/QgFMZjhkikkc/YK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSOXdump; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSOXdump"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3011737dda0so5301656a91.1
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213615; x=1744818415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmHMxU2w78+CVBOj7SKK51/xntQtWaTeeSMBQ6WnTFU=;
        b=TSOXdumpgtFsrjLJ5AtZOTO+bUbW8FbSUROZXYFhpqXU03tfoIId/lw1r46SKlWYlY
         9jfQAWGGT7QrdmgpNp3XSpssx4lMUwMFLU4PPFdSMpUDkOQZe6WC4QPORw8dpXGZ7fIP
         TWdxSk6jNmpt97ahjZUf8ILjJopMVbT+JjoaNJOKCgcZnOzOeABOj2lP8DPsoNTNqjLU
         kdlQ8WYRPxml4yrBZgSGTXUQy7bQe2P4oeMn13Ylw0iFZHXrdQUuFSirwpwcUyuvy9de
         NcVzfbhoM06f8zI5gKK/a+ecppx8HV94k1FW5VDRSm/2+HOYO3Skgh8gMk1F/dpl8ls6
         6BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213615; x=1744818415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmHMxU2w78+CVBOj7SKK51/xntQtWaTeeSMBQ6WnTFU=;
        b=C3HnZdLabA/hwag0BRB6JE3VOcd2VN2lFX0OSsjSxgULiU3kRFZ132mORLM6f9jpJl
         5ZDtY2jTCJ8uc1IGPKNqQKiPLHSBksf+YHEtlleurFLS+IqjXfUn0qNKyJHDNwmiRQQI
         N9i3KVI/Z57ffsba6bEycDbtEqdk/X2rCH1SuZmJgYKZ7a5Uyyyuk9quqUUMyh7ZBN6P
         v197kFcYT+w+BKtId9d+ahCc/jPBYtP+RKJRR83/5tA6SGzrW/YcWYDSmLaylOP+6nCo
         m4Kh4MtBUSw/8yp/qo/dRikNnO9JxGMYhUlbkGt4SlIR5+gNlNUg6GCtkJ37WJdzCSiX
         KL4g==
X-Forwarded-Encrypted: i=1; AJvYcCXbxVE3/m7dAzRl7AMkkVOjUaqa6NOrKjuBh0wRDHFQu2xF6y6tUlzeJG66RJdZxXJTmD6nAq4ZPqM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQpQofZBHysrk/ZFLjUk1sMisFm/Kkqx+CYjc8EGRSbHQAzZVM
	vmgmvinPxbJDKk1hPJi9KvkKxDYqtuFttkZG7LRCgPPTowd34Pks
X-Gm-Gg: ASbGnctzIoPHF8BGkGjQehxmhT/l769YPeaeiBg6aFmSHA834EJ1zGXu73xTPoEtUCe
	C3IxnpqkYYr/0kDR+MPaaAwSPHxRaELlGEEsHl3xMtxYO99lf25tB4cpeZ0bIQiRlnSB0l/QdB6
	Yd2cbhX+kg7ISfmNQs3Q5bRdQ2z8qWcp8LcW3mD/Y+johsGskelRZdBkcC/S+0XYpbNhkbTL0UB
	enqaJdf1aAMKqGNvdzu7309mZ/rvV8GE9hPTyI+SfUfpHog+18KVsN468s/ht5hcehsMlT3P2Wq
	vqQaP6bsmSrM35WVtwupXokoIFMBJEErGdEcLyHehHpJVFMBKP7XhfkD87HHo4LrIfDXgWo=
X-Google-Smtp-Source: AGHT+IFODj+q3bMay4dU940pWbrerSwhoQdYamKxEyheU1FRVVU9x2vDvw1G0LxNRVOTtBzOvt8phw==
X-Received: by 2002:a17:90b:2e4b:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-306dd3247b3mr3476749a91.1.1744213615281;
        Wed, 09 Apr 2025 08:46:55 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:54 -0700 (PDT)
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
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
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
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 12/13] fsi: i2cr: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:55 +0800
Message-Id: <20250409154356.423512-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/fsi/fsi-master-i2cr.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..692d73e892e3 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,27 +39,12 @@ static const u8 i2cr_cfam[] = {
 
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
+	return parity != parity_odd(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
-	bool parity = I2CR_INITIAL_PARITY;
-
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity_odd(v) != I2CR_INITIAL_PARITY;
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1

