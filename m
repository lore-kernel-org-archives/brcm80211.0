Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2A1E22FC
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839159; cv=none; b=FPDamg1IF9ncHK18EZQ/jv/ggFGx5DOT8y5zjZKS6AOQqKfpspBiLdMYOYPuSrGxDyPhBfXfr8bmQpYCi6cIMqC25PwmO9dvJiEXIGdv84LZpB/CQ8fBTgqcBu6lhzQ0ef1kKMpcVpWJZM1rKnFSgh1AZEUFJT49CuMU7I9KCC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839159; c=relaxed/simple;
	bh=rTA+nqUh4NnBYzrIs97e5P2aMLuYYBuIh+2ppv71b2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9JNEpwZyB6NeXNgFSQbkCQR5ENDSkKpIeRA/6xwReky2twlTe1a7z1coPnIVZlNNWJ5lPi08yQb//a9vdarteMwhHTw773fkugpugIzzvBDjWzIWLTZBBCfE8K+KXigifMW6cA1m3LyUvg0HsIiC9jMeqJh07yqszKV9IPOU3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VERvuNW9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VERvuNW9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22349dc31bcso56002385ad.3
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839157; x=1741443957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=VERvuNW9oY9BDiztCMbdOVYlBT3TNUrvWmdbNL3Cqi8sJ+bIciIA/AzWaYbDT1sv2b
         gmsXiJ7OYR6P4DVX+R3OSNOZNxxTFmPNjXBqYwSw8HTgphb5PVhXySRXI18z2cMsvvyb
         L8dBhCc+ro5F4HESkjbfk+j6iQbvwMgMz39YSSBlAjnYtNrWRvIz5LKiqFS5qKUFnODP
         HdcI/dRjnkYOH6QZ3XOf5F3/COV9saX8HqjnPAuEWnuwPpMtp7EDtVl6M5NiyII9ABLW
         kdguieTO8zlAPYF9gVfcCGV0O20BaEx8m5OS9mtdeYWnC9+u0LgUTlwE6ImeVbSH7fqQ
         LNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839157; x=1741443957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=SkMXphRswotg8hX0rVcyPjluGHaZT6SF+ZfBtzqgVMJ0XGRLYMvF4agJXzFDfrt+Du
         BBkxy0B3lDQoHdfZVPwqXorikewbyepEafxUrAJ0ljnpVuESq4TXc9rAV5mxvElqsWuO
         pDHFsn1XP77wMAM4GMZYO5/OWOqMdLPqGIRpy9S/Olpfg2rfQGoU4p1/ZLFFqMfC8RJv
         btzO3ZTQK88LFyL/VxiVOby65rJBuU7JgCyzZiFVuWSbWXrjtpBRbEVJuZ/OUm8u8RzH
         qbquW9f3U0BQq6OJZ4s9hpeLqLvzvA5+EfYa83AHIGVUq2QIsCRKWzG7Iy6/EUdOGNtx
         NuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyHNeiLc+yawq8gnx9DEJiwUEpwMOWMbqwj83CXPrjpyiIjGbQRXSh+Y5vjPAqSqwgPGGyOErkLTs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1tP7ZJbvy2rHQHWnzSzkHWRZsn3NIB5UY5fp1eaq4z9ZALJNW
	NfCUDqzGysJt/Z9TytDBSa2Hl78BqLyp+klN/hKHK9hNFfgbhZCh
X-Gm-Gg: ASbGncu4SIO1nQ34MsydteafGFb5Xbb6sZdwofsFCYimj1i2b8hFN/Lh/hu4uIyaHzN
	BCo2zizVIM130IGVUfe1n3HB/jlobFIYk3jwbq/wsAjtfBY5VBAzmLtLkDI86AbcVMBoF1lOHHI
	F3qrV4FYle6hR4JC2XdeI5Yw9Zp1dN6iy+7oT9zanX/yN4DCgbyb/1M+/n4hFgecKGsE+uMvbEt
	w1j8V3EhIALg/A6S5ZMDck9xUyZUqOqtkqMeqBCbsQxBu2rOKc37iZoxY2nKT99dNn3kMTkldpq
	rvSOpzPOhMmaEPVOJqDwpVmdlFWjU4DFjiOic8ppvxAxlOPyD8liLg78oAl9gJ8OGW60nTVzveY
	=
X-Google-Smtp-Source: AGHT+IGPradnOrYoMR1IanWjYjFo3KQDnHNjL2IS+TgfZGmLy7jDODNM73AvbKhXyZC7rWPMMIa78g==
X-Received: by 2002:a17:902:d507:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-22368bc6ae3mr104323495ad.0.1740839157468;
        Sat, 01 Mar 2025 06:25:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:56 -0800 (PST)
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
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 04/18] media: media/test_drivers: Replace open-coded parity calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:55 +0800
Message-Id: <20250301142409.2513835-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..e0f4151bda18 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity8(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1

