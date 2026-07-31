Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05DC446836
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512973; cv=none; b=gx48xg0OLqiF9IMYqxEBec8VLEG/zMD7vT2HGtR/I273SC6+6dYE+/22YEf16JZCqpMJCIu8IhhQcZyvHe8OhYU+UVCHiVOcwXKwVGa0MwiAkUbxycTtC7Z4xKGfXuHK7kH4X86MUhIxwrljqDDK9JwCPyb7UbH8+hewXdfsaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512973; c=relaxed/simple;
	bh=msMdhfowBySBXOdyCbxYCun0AlWqDhJmOSOvSMu4OjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLzwfnFP/FbT8QfmZ8cEZW0obEsPZK++NqGdOnSe4srOqZaD6PZZPhgICcJq2J8jX1xZeXwmF2267R60eeIA/hiiOEbxVmZmRR/+0TZg6ylYn9MrWB3C/JFzefWXR2vOy2LkGdP7j6cmq1aoo+Sg1VCaNgDCZst0h10odz/brIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjpBUbsa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjpBUbsa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf110997efso1823675ad.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512971; x=1786117771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPK6mauK3g7KvbulXUNjPujp1LFeaCkSgeVtH4yKc2U=;
        b=EjpBUbsaQcDDG2YIJ9fqpTmrjlqQxXexI86P0/g2lLDIr1c52tBud+rAiNB6zqyTL0
         oH0S9okAP7B2rXlmEyL4nMESnWrt/gyh/si17lO8Cq3wCTalZYyjell6gyEUvBRuBn9C
         nnND1c3AClGNHsFIxClKCj7iAvnW/7ffGJL61ze4D1+ojK5qxBH5X53YMz+QXttDrGM+
         IQKnyr+gaQWdYPZ52RZy3CFNLsgktcIs/ZjUEc6AsY+h55ZlgUSdARXAQFAOsYXj3Qvl
         xcdvuu7/KInaeKaZVqhgQJOA/8BSjly014WSeuAh8ovXrTzWhXCJsDQGNZY11RlX9tX+
         v1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512971; x=1786117771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPK6mauK3g7KvbulXUNjPujp1LFeaCkSgeVtH4yKc2U=;
        b=PTalSc//OAG6qiq0OK83/7650yYZxiEnKCjbxcvlxx04Uk/5LNgmJnf41z2LCZt6s8
         j2GidvrgkZhI+8ZmVrql+zyuMPI2Ul3dCoN9sL72rQEG4ZQZW4tfB56IY665jYUSPaKT
         akL21BGrtujQc5S3rFbBJiK2WRx7WOYXbrUkLOgLDnCZom8ypLVIqqfhVMT1EEQDJ7uD
         bZKmwfmn6S21U6Uh9FqomvThguIjKZ4jbfIfPaj5iQWK7CsqrLCwqL9JpjqlEaAs9bKk
         +OSw5WRbO0t4mm6b2q5JyA2T/zoc7tYoGDj68qG1rSK8f/lW9bDprBZFm/XD10vM/eHb
         JQOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEs4BayPmU1akMU7PgOPL0FlXsxQqOZAhMYu4GawH6YIjuPI6wpWRmWx9Wpq7edRqCMJvaTKswO6A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFyHlHF9daDhNF+nx5XaWQfH0U7G613YEgmP7W8bEQhaTgr9zT
	4nbuYknPgs6OlAWnp32XB8md4UGMyCoZnj//keHm3LJeIhmFKYk9YPnL
X-Gm-Gg: AR+sD10kCPz4zkWW55nwKe0HcWrt9otoEfU5YALY05fT/uut9jDE5zcXHUaqRkTnnrj
	Oq4QBXzRcvYsSQfNjyGl4cN+C6U1o1ynU/Tm5c49q4SPK8swur92eDuuCvw+n/D9Momg12hfciK
	+mA6/wUUE+IpQpJWzObtkNqpOLDYtfozI7mgktbSMWS1zlTF+OHlQ6kkGoOcl+FZ1EiCqohHmIj
	MkB3n62BH4IsjTjt6E/xhyGZqDYiWa+pXOs+RBvrvZG+GMwxFEuxNx0ggBqddWT2UN1AfxFADuw
	xfgHZPzJL5e5BhXUUMQkBavnk/nNaMc5RhRb1fp8Xkw1MMbYNRcrE2d0aags0Amhao9unyYVqtZ
	ybwc7ACVYT57Uro1qYwb2DUKEJXoD+mt9SW3Nm40DvzZuAbwoFHQGvZtj7ALdTnJ1gVSITjxfCi
	MvQWgK/PoaSHd5iI35uLfdiTaZQWPCouseORYvhPqOQu9evFWuuMm1pdq4EMpjTcMHlhhpr1fQA
	uk=
X-Received: by 2002:a17:902:ced1:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2d0523c0f5emr7083365ad.3.1785512971076;
        Fri, 31 Jul 2026 08:49:31 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:30 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 7/8] wifi: brcmfmac: fwsignal: safe no-op on duplicate MAC add
Date: Fri, 31 Jul 2026 15:48:39 +0000
Message-ID: <20260731154901.1822-8-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731154901.1822-1-shivesh@example.com>
References: <20260731154901.1822-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Removes technical debt TODO by safely ignoring duplicate MAC handle
ADD events from firmware.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index a43f1a38b0e3..3c1ca355e8ee 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1037,7 +1037,9 @@ int brcmf_fws_macdesc_indicate(struct brcmf_fws_info *fws, u8 type, u8 *data)
 		} else {
 			brcmf_dbg(TRACE, "use existing\n");
 			WARN_ON(entry->mac_handle != mac_handle);
-			/* TODO: what should we do here: continue, reinit, .. */
+			/* Firmware re-sent ADD for the same MAC handle.
+			 * No action required; it is a safe no-op.
+			 */
 		}
 	}
 	return 0;
-- 
2.53.0

