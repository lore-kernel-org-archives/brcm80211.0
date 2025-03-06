Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0917C213236
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278450; cv=none; b=nUexGq8Z1imVheMy1wY2fWwLLb9amLF78yHXf/aPJgCF42Wfg/5UNvP6Huq6szwQbnogBvC+FEFrZGvfsn9l7xeJxGm4/C3rFwYzf8Y0wBycqZ4XUPMJgnJ8EssvTO8bhJ8dTt4SImOMyk39qfjTtQbhuKxgJz7sbhRbPlIRWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278450; c=relaxed/simple;
	bh=WDPrYaKj7s26kse115+qww0IFHKFhkIMhznNoEr7JrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+XXMRbeCHw7eCWt99/yRpXf4lBRugwkTRqAcG1h0IqUQK+lWBHngbLAXpiM2cR07aWaAzctf4Trx1M62Iw99iVT17ufr/kYr+1A7SbK/xkoHYSSW/2/wq+EFCPmBfIxoChgs2QwHeOtSjsuJlndETQXhe6xtSm6rCbhTZS0FqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9mOXUTn; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9mOXUTn"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so1506834a91.2
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278448; x=1741883248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=M9mOXUTneIPaBY/bhAFX9fCDqTgAqk7Oa+dlE7Vk4o6rw+7K7AMdcau7U8u8ysM1gX
         GaWyLtg6H/GB+WR6ICICOf0ro3EjLcd6TMt5UnUllDKGZwefZxZUkLOWjOwJ9pDGmnjf
         T7mEShVaWUNxWK+d4113jH3QXZ05MPbH9tvQ1Q4cMcZCI6cc8H0KkOCPU+BKg19i81gm
         ImqWxZAnTV+sH9c+QIV8rji5uujalpFWByW8Lg3Kl1kKdLlCFIF7g7JHynkiHsMlU7dA
         OOL8y0yuYaX4Fd8G1OirLS09FoqojV+22q3aiKyxQPZI9Ss2ffKeoq0tm3ACzxAE0u0R
         9Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278448; x=1741883248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=jnaRlG+XopECNvax0/7OUozNH9DzxF8Mm4wircBRVD5Ni7tPyy0pSKhQtSRyjt1dEv
         i8oYSYjWbAQma3t4lQZj6yjD2xZT1fRST0LkDkYtejn9yyiE8VBNHizMO9SBhLXF1N5K
         H+E21VvQ8XrWEHjpord7jj2In1NvO6hNQ8sJXjz9T1/M64nuz87d6Yo/T1wjqY4hqowh
         aFxMG4btpgmCBj7RkgsQrqiUi07JcMmS/Y5JpHQOvbyjxMsaXgW6IFvUjvizFCvpOc6Y
         55cs3TcphH4VCQvjnVlZNjsT/+MFBjEHftRDcNeukiI4niA9RnzV0JXCjc41WdONdQqA
         YAOg==
X-Forwarded-Encrypted: i=1; AJvYcCUcJe2JtcLm5RQ1seucbraerL8D95d7nkvpQpjBb96Sp9vPGpE0kzolhKDNQeKqq/RM2ZV0tR++xC4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3GRKYKnZv5yzBPr782lGOjhoiGK9PFzrCWAeka8bHniiK117V
	IuxddVx6/4ZntxGrQo0JUoiqBN4fllCIs4Mz0EUvzTtamSI6MX1V
X-Gm-Gg: ASbGncsZXQVenYife9M5v9BQ63fd3f6zIecNeYTP5wyf7Q8DGAtzSpSbNElDxDDzt0i
	9kw3l5R3jykOLizJ83EvL9MIX9NL7zOwaH9/zBKdOx6BhuXX36H+6e39MuhXMoF6woLs7w1jx4/
	oDfGBqE9gklYm8vFuANiQrCalwX/pqWSUxNTOGqV/GCq7C5Vt1F+7SQew4XQss2ulEC5aqorbiO
	tbhFhPgBtBMjBmXDpnh+3XliDD3ni6uTAGLgDcNGQLGJ5aVrsDKHu6dS7rMathOD53JFzCfRlyt
	0FrDc/Ye5d10Cv1eDXYsWizASP8kwygiicer/BVWcLtpBoowRdElqD2rgrkn45tunbC4plKOYtM
	=
X-Google-Smtp-Source: AGHT+IHUo1VQ1LAiyQ9UXLap7uh1jhPtCUcmwdFlNac3xPKGa9S5gSb9W1skAcfvxZCU/ssK4wuDpg==
X-Received: by 2002:a17:90b:17d1:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-2ff497cd4b3mr11755081a91.15.1741278448219;
        Thu, 06 Mar 2025 08:27:28 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:27 -0800 (PST)
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
Subject: [PATCH v3 09/16] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:34 +0800
Message-Id: <20250306162541.2633025-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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

