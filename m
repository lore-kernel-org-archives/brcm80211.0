Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C50139D0A
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329083; cv=none; b=LMzdff1QPk0TyfwKaTXo1b5wdIXvhlB8lL+sS8p51ozJWwzqdjYAVrB1Q4YDdXGg2fCCMq1qRhfUBvvB3akN/JwZvdu6BLipJBRAK3aAKvgCO/2zolbYgS8U0RfpMVOag7gHKPqjTAsb5gDjv6YdiaxYWCRSFUPzDq4eEKr+Urg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329083; c=relaxed/simple;
	bh=WDPrYaKj7s26kse115+qww0IFHKFhkIMhznNoEr7JrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sH68+igD1+43EbmOW+GL+FfWsjF5jU7a/zqRtm416Q3uHd2NLfdCcUEu8WjZ5ahIgtx9cQ4VHUUI7Y+eEwzLOdhRRAMX2V0N/RgDfDQZY022dPDJQ6j0cDQ7DkJ0LPPIx5SzydW35JPtRqPLs/YWXSiNnS1pkkn+Qi+qgis/b78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuuYKaDH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuuYKaDH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21c2f1b610dso104724265ad.0
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329082; x=1740933882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=cuuYKaDHCGIRY/rNdNwrAuzA4cekKtUj3EwOmEEZTTGHbSJIdjKR+ZyOSb4+kOWZ5x
         +vjbmY9YYeg2oYnc1PZXEMj7+TzjFFxy/LjK2vH3IezPgFwM7YYm286QX84nNrrXKACM
         g1YlF/5QwfFl+IXb+6zSuc2LXxc35dWYWnN7Hw8PGpAQuG3qpc532+chG8bJdg9X0f6q
         gHQdtUvgY5KtNmPgPwESXb1nnrbA4Sb/yHDEGKr5v9//QVDE7M033IjNV7Ks79bmqw9r
         cUVwROLTag+QNOBPDORzhoTmRndG+g2oyAh0+CAoPAO8+tMp3Hdgm/i/7m/0ldfTBsKJ
         +WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329082; x=1740933882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=hjCcPsjWmxnXKRDcUJyy0JVNOwaD0SLOF5VybGPRf74U1lqO8Umx7xzWSoyD2tTFGV
         5bPWTiyH6t38gZcU+zKdnwbjry236Nl7dIgsZ+8qm8B2n0rkSXrN4njRhcI0yy/Nhsvz
         Nny2c85zBg4gEoKi9yGypewj/uac3K7n300aAE+C1QVcihF4hlvqL7RuEyljXBVYA/Vb
         T5NhSpGER8hwYP9PeZ+b65vnRf8BaVYRHvDj1vLfgInAoKLueG9pyTEM6x+Hh1QXO3Qx
         5ZHvPYWB17eH9Wru8Al/LQMwRvTCF8IDApR7gh5Tinorm7JuXgEKE9rZBpmx5qrD/MnC
         NwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs34zRhldSQeSkAjNrnii/i3FvA5xeuu/lQGbVCIeZDy5tSa6yMhEYQTTH3Gv/0rB6QQU4yPqWzl4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZunAqmM4dwN9Ua0Rt8oUgO2OPA5aS4lvlF0Y/3hA8ObJQTSkd
	8CSssFladrH97ymNNBRWifK1iB0gtX0DQlLSgU7n6tu7s21Fe2dU
X-Gm-Gg: ASbGncuc0IuMhkauZozLqmd2asUO8pbX6QQdVevkZ6T5vEvQo/wR/mUiyzixv8GKdG/
	52uL0ZWFlSwzLMJfd3YHJj3fad4uABz9dXGDjCdo8QaU97+2c9TkTicwmhozc/cXY8uY+oiJUIL
	kmGooYEbTOvPjknpdZwPZM7t1hCh416yYepgArWLECyXYaGl1+xaLlppHtuxSSwZURnqdvzs021
	XXIpj8PbutWnIkk+RkubZttznNLGnyqgM3SMm8ZRBgKadwgBxu0aNy1abgPUZBLyAoLPFBn0dmH
	AnOnmZ2cFXhagwFAiqnRmE7P5it89TEhQUE6drvJ6aJo5qlvC9S3xBbG
X-Google-Smtp-Source: AGHT+IGsE1LtqpOiLzBH/xsJP0qffWffejZOaFdgJ8XT2KOaHV87U7eq24SL1hIn8uNFPIxHHHWZ4w==
X-Received: by 2002:a17:902:d54c:b0:220:e023:8fa6 with SMTP id d9443c01a7336-2219ffd8556mr169735225ad.50.1740329081702;
        Sun, 23 Feb 2025 08:44:41 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:41 -0800 (PST)
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
Subject: [PATCH 10/17] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:10 +0800
Message-Id: <20250223164217.2139331-11-visitorckw@gmail.com>
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

