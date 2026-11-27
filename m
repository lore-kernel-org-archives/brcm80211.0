Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760014;
	b=KUj1OQXJBjmSOX9lrsed0CNT95mlncIBz4jw6GndqcKkwPsX59easDfADihMMa86LAKf
	 r1OLI3Fxl3LZiHlppFLLZ4sZzhBpdyydG9wQYyv/Ea5QmMKyXwwYaIbBbl7IxW7b0Wefy
	 9y3+3abzVuUQb5IwNM238g3JnQoRWzWOg1FwaNBM1wr3pjGPGT0oU6Xn8RUwxGeT8DnhI
	 GNruUTWgm+DcSP0V7ByBngok6vXeKXVIrpicxFqjYW7dUPwI0er2DVDhiYC3Iu2JTKUwR
	 fCyGJHw/SEfmHxe52O0rQp7WFV9/m8cNbMZxmHw7yTGo4QURDxCy755CYxxIfY9ul9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
	b=Mw58STBNDCzme9tsDRu0FfAv0EmzFBcYUJJm+B33yIdHKhHw8Fu1kXx+kGf6R+14dqot
	 0OvRGTRdpUeb1mMtC+5/QzgFnvNM0Mt36hpCcfQYbpP4uHdP+tqE0lE7iPWkpesOwAuaO
	 MdWEmXYFVLsYMmmFYfqcPUoLbuVtjQl0jbjHKoCjW8G496hasAmS/rYBSKVX6r7dcOktr
	 YJ4/yt2eiO7FaGCDnAxQlP93TGucnQ6y2DaAR1dnjvu9zGZAcRXwzrW1yNPqfjfIsSepf
	 vkTPUp877hTWNojQxAb0ZdFE255/fbr/K9zdV9Cv6oNDyM1TUnXyY7PgM6BWu6KLmFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iBrPwWzX;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE6606A32F
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 06:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DE6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iBrPwWzX
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386d1859e1cso2076743eec.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 22:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760013; x=1796364813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
        b=iBrPwWzX9bXA4cF9qOS8CacHHXz4qhoiQh6De3kjtrtOVcXqmeNJRdC1W0FgYCvZ2A
         MXgXZgOkUsrLrpiJbPuEIlY7jZ6kBFHjHcsdneoGuxnE1/ewH0+EEhvEKZ5FV8CTgJTF
         OQiXMviAnO9HKzo/7eJ4Jer2ZS9JGFx+17rUZVMgevofJLEdF6wA8qq6qaNGz/Pmg+oC
         fbpfGhj7w0NUw+UsNzAWLNJUoOtxjUiBd25laEG+yk6gaqolYhcBvmf1sXcLsFwihC37
         nclE/hbQWTdCVvXX+S182CGhpYT288j4OSVdcDA49GU9bJSOtBz2ZDjuC56Fr3g5nNai
         +Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760013; x=1796364813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
        b=taAu6la7hIAU61yXGOgFR+kGYZYGzeVZg9sGlUYSHhRCr/3wJ5QDO6Y5kCbSjTuBc+
         B5LKLKBEFlC+9abluOD5CKEtIH3hwwnSZdnMmZb1w92FSLKSsx4ewKKekrbG/45PTcHM
         Pe4+iYVlICy9h1joe3KqZ5epIZm2cu66l3XscsQ2jKUlmUPncvVXkFg61fG3rLsUQh40
         duhcAzEf8ZVSx7SvTHO7d4BTAJEHvTtWtwF730+WSdH3/83egtpOF+SO6HJFDSkZ64qO
         azy5a6LrrMsVvA2M4tuBG909Rq9JIvohDg8NmQA6LL/Xz8nULjV96uglNdCWw5hU/0YM
         Fnmw==
X-Forwarded-Encrypted: i=1; AL+hErEqOazJGuMlLxO8IzSPqMYo3C1gIww6Y20eWHBvZ1vsrGLp9wHc32OOLEcs6ueYcARWG+HJhEHLIFM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZRzwxEubV0oVRXeVoF6oFQCihNHnUg0x+UPJlYNJ33tRDIhdy
	vY1M1q2LkFm2TdtF+XhU8+QHEgBgD8V6EPKUEvSlqR2gCOfk/NLAr/4k
X-Gm-Gg: AZFdTZfDhm0FBEiPIPTtzwxcVwKvqMOH8v2B1l8kkZTbiekH68CIBSdaHQBeji9pY/h
	cqAKqc/L1r+UrR1iA/nKJJZXf9QeWniBRJ8fKCqAvujo6ccfG0s1+8CEseXB6SZ+jZUi6Nj4Akn
	fNELY34w3sBD3FR5TS2KgtGi2ZHel4GBWJh0z4kb2XvL8C3kq7b5LgYdbqtMROohWorCBMFfIxV
	7cW00FVRMzblgFyxHAaPbhvtk2D7FExOIosPBWKY2h9/DyyLc9lUB9U58MiEumhzF3adBYVojFg
	hxBTrM9HMjE1GMbhZf4Sk1JD83aYMNZhxNWHs9lJa85wEaqSyX9cb8NP6fl7S1r+Guf8KMEfuXg
	zqKe/0WW3FkUmzvQcg+qWlga1PoIaXiNa80vk0+COwrYjhMECVuFv8u+SYFbH4PkzMQa4UBUZjt
	9oPjXiXdlumngr7PitN2hioVFlGeSz7j2x+DUgTVA8iBSgOhziiU5/Pss3jrZtOBe+jmHnzSogY
	ehwXavfTIcHrvQXXapPpddNj7Aeje3Db25D4lguK5EL3HJFvxQ0PGCvZL2e51C7tgHAD3RjZPwG
	giGt4by1gOLMIOiH5IOqsXSeZDlqcq0apgEURv+uk6jOWVP3hgeUvlITl+7kQn+U+V4BNg==
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr26535715eec.24.1795760013363;
        Thu, 26 Nov 2026 22:13:33 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:33 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH wireless-next v2 11/11] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Fri, 27 Nov 2026 14:11:41 +0800
Message-ID: <20261127061147.506129-12-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Broadcom USB bootloader downloads firmware the same way for other
USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
firmware header and response layouts from brcmfmac's usb.c to a header
in the shared include directory, so that other drivers can use them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/usb.c         | 68 +---------------
 .../broadcom/brcm80211/include/brcm_usb_rdl.h | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+), 67 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
index b41949a9bd..e48f064682 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
@@ -12,6 +12,7 @@
 #include <brcmu_utils.h>
 #include <brcm_hw_ids.h>
 #include <brcmu_wifi.h>
+#include <brcm_usb_rdl.h>
 #include "bus.h"
 #include "debug.h"
 #include "firmware.h"
@@ -26,8 +27,6 @@
 #define BRCMF_USB_RESET_GETVER_SPINWAIT	100	/* in unit of ms */
 #define BRCMF_USB_RESET_GETVER_LOOP_CNT	10
 
-#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
-						   has boot up */
 #define BRCMF_USB_NRXQ			50
 #define BRCMF_USB_NTXQ			50
 
@@ -52,71 +51,6 @@ static const struct brcmf_firmware_mapping brcmf_usb_fwnames[] = {
 	BRCMF_FW_ENTRY(CY_CC_4373_CHIP_ID, 0xFFFFFFFF, 4373)
 };
 
-#define TRX_MAGIC		0x30524448	/* "HDR0" */
-#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
-#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
-#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
-#define TRX_OFFSETS_DLFWLEN_IDX	0
-
-/* Control messages: bRequest values */
-#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
-#define DL_CHECK_CRC	1	/* currently unused */
-#define DL_GO		2	/* execute downloaded image */
-#define DL_START	3	/* initialize dl state */
-#define DL_REBOOT	4	/* reboot the device in 2 seconds */
-#define DL_GETVER	5	/* returns the bootrom_id_t struct */
-#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
-				 * event to occur in 2 seconds.  It is the
-				 * responsibility of the downloaded code to
-				 * clear this event
-				 */
-#define DL_EXEC		7	/* jump to a supplied address */
-#define DL_RESETCFG	8	/* To support single enum on dongle
-				 * - Not used by bootloader
-				 */
-#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
-				 * if resp unavailable
-				 */
-
-/* states */
-#define DL_WAITING	0	/* waiting to rx first pkt */
-#define DL_READY	1	/* hdr was good, waiting for more of the
-				 * compressed image
-				 */
-#define DL_BAD_HDR	2	/* hdr was corrupted */
-#define DL_BAD_CRC	3	/* compressed image was corrupted */
-#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
-#define DL_START_FAIL	5	/* failed to initialize correctly */
-#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
-				 * value
-				 */
-#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
-
-
-struct trx_header_le {
-	__le32 magic;		/* "HDR0" */
-	__le32 len;		/* Length of file including header */
-	__le32 crc32;		/* CRC from flag_version to end of file */
-	__le32 flag_version;	/* 0:15 flags, 16:31 version */
-	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
-					 * header
-					 */
-};
-
-struct rdl_state_le {
-	__le32 state;
-	__le32 bytes;
-};
-
-struct bootrom_id_le {
-	__le32 chip;		/* Chip id */
-	__le32 chiprev;		/* Chip rev */
-	__le32 ramsize;		/* Size of  RAM */
-	__le32 remapbase;	/* Current remap base address */
-	__le32 boardtype;	/* Type of board */
-	__le32 boardrev;	/* Board revision */
-};
-
 struct brcmf_usbdev_info {
 	struct brcmf_usbdev bus_pub; /* MUST BE FIRST */
 	spinlock_t qlock;
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
new file mode 100644
index 0000000000..bf6665d33f
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2011 Broadcom Corporation
+ */
+
+#ifndef	_BRCM_USB_RDL_H_
+#define	_BRCM_USB_RDL_H_
+
+#include <linux/types.h>
+
+#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
+						   has boot up */
+
+#define TRX_MAGIC		0x30524448	/* "HDR0" */
+#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
+#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
+#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
+#define TRX_OFFSETS_DLFWLEN_IDX	0
+
+/* Control messages: bRequest values */
+#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
+#define DL_CHECK_CRC	1	/* currently unused */
+#define DL_GO		2	/* execute downloaded image */
+#define DL_START	3	/* initialize dl state */
+#define DL_REBOOT	4	/* reboot the device in 2 seconds */
+#define DL_GETVER	5	/* returns the bootrom_id_t struct */
+#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
+				 * event to occur in 2 seconds.  It is the
+				 * responsibility of the downloaded code to
+				 * clear this event
+				 */
+#define DL_EXEC		7	/* jump to a supplied address */
+#define DL_RESETCFG	8	/* To support single enum on dongle
+				 * - Not used by bootloader
+				 */
+#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
+				 * if resp unavailable
+				 */
+
+/* states */
+#define DL_WAITING	0	/* waiting to rx first pkt */
+#define DL_READY	1	/* hdr was good, waiting for more of the
+				 * compressed image
+				 */
+#define DL_BAD_HDR	2	/* hdr was corrupted */
+#define DL_BAD_CRC	3	/* compressed image was corrupted */
+#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
+#define DL_START_FAIL	5	/* failed to initialize correctly */
+#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
+				 * value
+				 */
+#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
+
+struct trx_header_le {
+	__le32 magic;		/* "HDR0" */
+	__le32 len;		/* Length of file including header */
+	__le32 crc32;		/* CRC from flag_version to end of file */
+	__le32 flag_version;	/* 0:15 flags, 16:31 version */
+	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
+					 * header
+					 */
+};
+
+struct rdl_state_le {
+	__le32 state;
+	__le32 bytes;
+};
+
+struct bootrom_id_le {
+	__le32 chip;		/* Chip id */
+	__le32 chiprev;		/* Chip rev */
+	__le32 ramsize;		/* Size of  RAM */
+	__le32 remapbase;	/* Current remap base address */
+	__le32 boardtype;	/* Type of board */
+	__le32 boardrev;	/* Board revision */
+};
+
+#endif /* _BRCM_USB_RDL_H_ */
-- 
2.53.0

