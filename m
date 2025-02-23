Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C1209F27
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329106; cv=none; b=g2gOQ5PNmdvf8PIBa3q7QRN2H/CVQdxhV3qTtSFvTBICcpYQy0yGq/q/ox92znbYbbrm4RSdbXMwYxIml4m4W0+PQluVUn5e4KkivT/UwBSCVmrfulHseKrmMpSCKXsoxwZDqiZq+EXYpdFivFnuqn8mnbeSsE8gyOjXgMyf8qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329106; c=relaxed/simple;
	bh=TwYwZvCrklNfcmQ95nA9Xu2F+v+lRRPBTM6pl81qOZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2sWytL9Bksbl4MTRYAdNQ5SkkG4uERxPVLEsV7ECrCHCwbSnuMBrMQFW7jm1O1rAlXSCrGN6J4Mc4veBFGsXEYmO43LdgUuoBjJXtcp4id6Jt/LxcfJ8tYO+LSPsR8J6a7Exljo+0sAHYLuhhyh4ztLyY0W76v2VajSO/hOK4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN6a7vI+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN6a7vI+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fcce9bb0ecso7231960a91.3
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329104; x=1740933904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=HN6a7vI+hfTJcWniitw0d5tFxlVfvs8SOPTmLI1KE+xFfy+H/CdqMpH9pjoUD8T104
         cmpNwpRIZiYhiQg/ohksJNFkPaXmZh15LrXmdNVBEPR2fmumk34mxP5nwWwMie+nVQUF
         7vkTE1c4nTMvRSpZwbuRh37n72LJ+HAoUgBmjwOlDNsumvBXU6Ya2fpze3IBa09KrD/b
         yZZJ0vADyqMfjpgfJ95s0NIUDKTmw2S3VwHaWwsFyvQXgVzDV+i+d+9ogK5RA46BYUPD
         zZkIC+1z0hHdKBiUOUdnbu//r+vmnkOpmgvHRmt1fd+qeWKP+8xdvpB418XGoE1xBvG+
         vOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329104; x=1740933904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=eCHQrpRAYB7jRLFSFSI136RX01TdDVF4Zsa/YOJ+CqJQjmO9wVcKLwRw/K/AIX4jHn
         k3fdkBdy1qCDzxIT9/hQazsN9OnMG6rF/um3ju+J+4J5azgM8xe4qvwf7ZRFbemitG2H
         BTZPRfm01LlXcnYSXCqBZo2Nbn5SfwgpxtpmB3p/Bu0uS+cY8qL0OyhExI+nCi2CzL7B
         K08T2xvjyqSIe0EkOBM6dpyTAN4NNPxRPdoGEyfxNPcXlkN/86YIR+uXpwH2xKRdiMSh
         VcFz9/xdLosH2So8JbHp1/V9rBVDmHy3967rsyHlgsbNQmwewS/kxe+Jmq6ybphjajRB
         yFIA==
X-Forwarded-Encrypted: i=1; AJvYcCXoJt3ciBBUY5buSXceRXBD9V95apfqgPHPP94sd1Ydpl+rdyExCXO/YGjCiUwD7Vxjy5q3kzhmEik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc8nV9oWvp25/cWnzTL6IA8ltoZX404jZDLwUXSF/KssGCDCdc
	UE/uvkK9RlnY4s8Z030ozB6atgCHUNln1wieK9KJJiT6roZW+agN
X-Gm-Gg: ASbGncuYHIodXhvKXjoNWfYNkjlEksHjTS2NnrFkbOLcaiPR2UNQZfEY/nQL7yYnpUR
	i4IRU1eOqT3PVsrQ1Y0Qlno9LsQnsfe07E/bPj0asQ5vpsP1Ml3IoheMT3On3yl0nJyRYt9fvoC
	il9fQzqlnPr1TspVDfq3hLxNvoe1ylVQT5FAxPAoJZNeRNK71u01a9r75qlfK54e2EBsyEsLorQ
	LLCz+n0MeQKHV3O0CNQTT7Q78g9zohhboTn5CpyBsVyV6mNP8K4bb7uZ/7KQ/8phFHJtFMG3Olt
	Ri6d+aT1Z0yQW1SWW9pp36wIBSWSB0p6Hm4FVCCIQRHTFdKptA1b8L30
X-Google-Smtp-Source: AGHT+IGJMVNjh2ZkbH600/jnGa2+6i7gpIXMvZAnEqRCXvTYi+XMSGJQL5WK3aQh+mNtGiJ0yE3iuQ==
X-Received: by 2002:a17:90b:2590:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2fce75e1b18mr21089922a91.0.1740329104301;
        Sun, 23 Feb 2025 08:45:04 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:03 -0800 (PST)
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
Subject: [PATCH 12/17] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:12 +0800
Message-Id: <20250223164217.2139331-13-visitorckw@gmail.com>
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..833e65f33483 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -4,6 +4,7 @@
  *
  * Written and tested against the Designware HDMI Tx found in iMX6.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -171,12 +172,7 @@ static void dw_hdmi_reformat_iec958(struct snd_dw_hdmi *dw,
 
 static u32 parity(u32 sample)
 {
-	sample ^= sample >> 16;
-	sample ^= sample >> 8;
-	sample ^= sample >> 4;
-	sample ^= sample >> 2;
-	sample ^= sample >> 1;
-	return (sample & 1) << 27;
+	return parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

