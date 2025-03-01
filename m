Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B801E1A23
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839221; cv=none; b=TYtq6WM33CjxjdO+/PtLmGg4kfClT1qt30y5+C4jnu3LCljkBCr4fvyc268NQixSnH82KWwu9zYw70ptFyKyLmbsZx1taGKahaBTRwjygz5WZ/JzODRf4zLhHkowmw95uKshSLcYEX9W1CY8mpXb1lSfjLYQbEeOZvr/ewJ+9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839221; c=relaxed/simple;
	bh=WDPrYaKj7s26kse115+qww0IFHKFhkIMhznNoEr7JrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mi+Jf01wRHJDwmF5JcGp3fNxkmLbfa7TAEq9MjpIDSpDMb5kjsrkRkFiZUr1enNIYrgzXRZWz3EJXmAO/b8MI6GkUTQ3hGRyj+iqC+v4TkRO68hglxFgIcbqUfg9iSSYA7OHB/+DCIFCFvfdpJ3buH74d8OwY/gRzIcwX1F56Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nepyMHxZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nepyMHxZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2234e4b079cso57664745ad.1
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839219; x=1741444019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=nepyMHxZ580cO9889W3i7DecKRJjH5wEHkV8LXoghObtWs8vH+rinW/RoB1zgLsZxF
         2oZzkceZ8Euc+U/ZKXLU2zmqTQI/2JPqENAP4oCRWlAxkw2pseaVciGgZVnq6gjsCYGI
         0sBrpyW5ml8pFq9sr6osfqn6dyUI7wv+CRZCF+u+VatKOLX9r16JC3kNiqFnLWo/as3E
         hFpfXeQf+1BTBk1ujJy8TlLLD8cQs6AAW397yjUHFThx9cH1pDja7YsHuShW/7ONU8Nn
         KrTz4dK7vgRgZTQxczZAzxKwAP8rXm/H9tuNp9cyM7ZjO5RQVUIQ+dgDFFm8dtqprkHX
         85jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839219; x=1741444019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=SW7KfWTPswtYdVyJWn6NY55AsKFfRDEJcZszFFjEV6HSDmVrltA0s1qo5I0xoQy9jP
         lZvjyp6K+19sAhbWap+pQEaZGc9FWyP8OqdSK+qMIsftv3BZxlt30V8lCQD1FHQBAaKZ
         qIbVy+TOLZXmgKJJ5sCXQS+KZmrXPFwv6o4I44BnG300Tj7iHaWZb0fEHz280WNYeMhz
         zXLqt0/0pvS59k/RlUPQpEcd79BaKQZ1VzTHmPqWhZ6tM+y1fkp5gyY23eIzzsl68pFX
         s+TiyCTeb7wK2p/cUwvX3PX7e4PneoKfjyEsULQkEy7F5x9VlyZ7uajFo0cPG7wK/aZG
         R6IA==
X-Forwarded-Encrypted: i=1; AJvYcCUktkB7DDhDcjJcdC1rX9yvRoECuW9xR9G27qNyPNlJptFw77xla2CLproek4XHRbrAorB4pypLilk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze6bJBIPvG3MQVfcztpFVYBQF91LeTBaLJgRXXJ2N/FVv+Z1S2
	BiT5LrOCln07n+vT5kUY6l3CbwNM23xA4V6iurPV8seB1zz/8W2X
X-Gm-Gg: ASbGncuvoKhOvYHeLEiTv9fmB3kfC1QLdGnSWvQs1J1CLRMkM1+/fSs0j39hG/RiVBu
	ftrc+Cz66DMmceEpvUpVH7Hs7P3W+zWf+/gXd4P8DiqYZCnWxPb6jdK31/doIUlujbvkUG+arb6
	i3IxbRRdMEujhHbCXmZEDCsBvIG2tMWT7/cDk/fGNLMsy/AOc3MbKgaAx2QGw2uwfc0yT5fmRcR
	WPJ9HKI2XzTgiIJ+s1hIZ82iqB8Nh08LzQX+aIIlzoVrGO34HtTsIpdXD/3f4zjCGonTuAAGTFf
	cRJX3utev2/fsxeG0YLuRu7Tx5bPOpzV+lUj7TlR0taXIzLHZS+JsgQ9PghBLyKwTEFop4YJxtQ
	=
X-Google-Smtp-Source: AGHT+IGwTX1zwhWAXU1AZVXFy1OzhL7kB0zYwA4xHDy3bfQBeELXGyOD8jSe52YiMtbVSQB6FlE4Fg==
X-Received: by 2002:a17:902:ce0d:b0:223:4b8d:32f7 with SMTP id d9443c01a7336-22368fa9062mr110269565ad.19.1740839219506;
        Sat, 01 Mar 2025 06:26:59 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:58 -0800 (PST)
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
Subject: [PATCH v2 10/18] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:01 +0800
Message-Id: <20250301142409.2513835-11-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/oa_tc6.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index db200e4ec284..f02dba7b89a1 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/iopoll.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
@@ -177,19 +178,6 @@ static int oa_tc6_spi_transfer(struct oa_tc6 *tc6,
 	return spi_sync(tc6->spi, &msg);
 }
 
-static int oa_tc6_get_parity(u32 p)
-{
-	/* Public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	p ^= p >> 1;
-	p ^= p >> 2;
-	p = (p & 0x11111111U) * 0x11111111U;
-
-	/* Odd parity is used here */
-	return !((p >> 28) & 1);
-}
-
 static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 					 enum oa_tc6_register_op reg_op)
 {
@@ -202,7 +190,7 @@ static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_ADDR, addr) |
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_LENGTH, length - 1);
 	header |= FIELD_PREP(OA_TC6_CTRL_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+			     !parity32(header));
 
 	return cpu_to_be32(header);
 }
@@ -940,8 +928,7 @@ static __be32 oa_tc6_prepare_data_header(bool data_valid, bool start_valid,
 		     FIELD_PREP(OA_TC6_DATA_HEADER_END_BYTE_OFFSET,
 				end_byte_offset);
 
-	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY, !parity32(header));
 
 	return cpu_to_be32(header);
 }
-- 
2.34.1

