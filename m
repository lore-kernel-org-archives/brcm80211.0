Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460178;
	b=2WJKT8gLfY8QMfP25/y707x9qpcl26B2K8DrRpdNY1M3lmpZDJHOjWeNLV2rSG1vB1ZI
	 ZlAF8g7ZTqF1NT5p7T8clehvA2d1/8YN0nu5ClBMuaDkQ0pD0wZL5k8pHe1m4RYjKnHww
	 vJBJd3YZmcVmYTEiMrm3fqrnazWMgPWE6zHXOsnLPcc3phhgxEen6WBOqrIoDk2xKJjyV
	 Q24itTBymW3TSHGpXpBKQXmehdDYun9c+yRKGK4vQdZVttQOJkgOLPeV6nOiQzfb3/gSd
	 EVGqxgkW3E0ehaZKJioMJHZfN656a3vrPeVZlh7QR2gbkK+aEaiSQ1q89B3mI5k+naA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
	b=xQtiHsPJMzzRDKpwdFie3t8ANI7BG86gMlrI6CgI/1eouXkm22gKwgo8xCrqoGixTlve
	 dIQplaJbMKil5egQ+iqriWTDAjzqUyqZQMOJRpnu6bwp53n6jyCtZjQO6obZFKX0VnT2h
	 PMQrw7W+0BgVgscHQ7t2P+DF4kH0sW7sankozHh/EhdBW+iGHyiNkygZsLCLTMFiR2R5Y
	 5uYrADwg733G4VVTJraA+uLiP83ycF4jCoDW2hOMPy3vpiiOzkTNKLhdr1VlPwrn2gL6I
	 dC1wH4CySS+rk3VDJGgHRfc3FlwZbKYkz50LTiGhOHtsUGzSHvYUh67xrk839FvvHsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QNShbfsW;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA51606A323
	for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 05:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QNShbfsW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3704d30b84fso4943562eec.1
        for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 21:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460177; x=1795064977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
        b=QNShbfsWkkQJVzk5mN8x+5kg1tztlnfaUJVMQWSGCjy7g3vJ095L3ziHrGYP0dfMNk
         lwyEoRCljbEhV+7ClvzYlA2jEfoue4mfeMvdMYbHs6aMbdGOMMolGwfl0KRtozxNgt2I
         E+8rQJ/lhuXQjJ96wZTqiLHmoP5+Ya4DsamPM0vguY1cesXkhbTlzzQ9w/je3TqyflNP
         HvQ22WpNzF5WII+jxhWd3vBkRNxqsKUd/IDIpEitkrKC3JkXACfxo78Ek6sYjtCXCrYO
         s9rJ8PsKNpF/dWzToU5cuRKMjQl8An0wu3LYddjL071+Eu+ytEqYAhq5k5VVSGTLQZYc
         r5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460177; x=1795064977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
        b=A/pJMGAkLAAviVDzIy2xvKmvypkD+gxpJm1FyVAFdSW6zfna3Pcc6/W+7KMhHnYsMX
         w51tfDuSvR5KNhaCaAouEkuuGELurVi08tMY/1EcCzOzAyU2PlNiptfIZc3gK6uQKiCC
         sS3JzgShFH0Ban/oG1R8XGYYHmawnBAyXgmXEpId1+5HjP26wbkkDPD6DbTgYWvYA1G/
         v6yPuoV1J3APovEYFfgEpLFXnKXgdzcLUR1OfMXDnc3XuI1WTN6pMwHzxuKZl8jAIZnf
         H+v6nmI5zrDg3xrdoUSMVhZPdbhs2IvbifdHiFAMtxvdB8SBkhUUD6PhVRUfNd1vfjSy
         jmLw==
X-Forwarded-Encrypted: i=1; AL+hErFMMS81QnWeq9TU5kRPOyR1H4B5OuBoGcwyRgoEig6Ixcy8E6WNXnB91H4oTHJ2RT556AlHLazBgMY=@lists.linux.dev
X-Gm-Message-State: APuU4Z857ZQ8+RcWSZV+E6Od3BQBu/dDJTw38vPI/a66nD5u2z50UnvD
	6inmMvlRsEGvKvwDBe/5a+nY+grC0FVe8B4Ukior4Lc4HaZG9YEVHWYI
X-Gm-Gg: AYBFou1EOW9S7vKR+OjkEx1YUKyUng7DznSnaJyWxBtDzmO55YGCcc615UEXluwAjYQ
	LNDeavaYyWiIOPS/xHOF2T87tND37BewUFKtHYH1hh4sldrHM7OTXw6JNFFiMpmyzBU4ZZipq7p
	2UNf92ewzwA+dZIwAI+dTcwCQFXYF4tOjeJgQz2zO3Bhzy0AblOhjzhjsjA4mzy9emnVOYaMLsE
	F32eh/hAA1isDn/yvbg+VAsDz0cBZFYxssCLQBXVRHEjq+a48Hst3kH0/UDXgP0IQ+9x4eQkj43
	aNCemWxSPJ8YHxBOT52yfbTSOZOwdxPhtgUKqzad2REcGUqAleTVbCe3LOXVsNInbcU33W/7xTN
	9j/Or83G2nz27YUimPryZkNex+lLgwNR2NQnmD0zd+vHKHdXFJZdEr97FHdZN3qFGGUKPHJIMp/
	8aDp9wSOBokcEc/PZH7WG2pZ159QLwmtirNpuZa7YrF6fhDziSelhlUQbIrmIy3wwrL6aTKQySX
	FCIyK2ErVuq8iW+zJI5nEXNNMIwURvpqCRb0AnInyIn7UsABOKze/n/CkqnU/UcZdFRGlECO0f4
	zMkOIgW2sdenLIkNlAbzvU7hehF9JoFGiN8YpUUqFwPOanz65yUWk8g=
X-Received: by 2002:a05:7300:d404:b0:372:32a1:b384 with SMTP id 5a478bee46e88-3768695036dmr4937182eec.33.1794460176694;
        Wed, 11 Nov 2026 21:09:36 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm19537627eec.13.2026.11.11.21.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:09:36 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Thu, 12 Nov 2026 13:08:15 +0800
Message-ID: <20261112050816.2795512-1-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
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
In preparation for the brcmbmac driver.

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

