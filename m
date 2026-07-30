Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449F468C39
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427495; cv=none; b=FgYrI/YMdD96IXZbMyX1KGBI01dV/z0/kFBha8Gf8WfcVv1bmT11u9mQOeShxHinqgk5LabXW/XIpSYhuwZ2i+UK8jB2hlzCAxRQeNW1kUrwb//OX2QS0yEd9MVVSc6h64/bKb+/IRDyjKCL527CcKjU2YZP5gSwELcQdu5v7Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427495; c=relaxed/simple;
	bh=p88XlrozqCp0s3F6xoru/MvtjflcfHotb3mOweyKOX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZr+6fD5do74z79lhpyTXMP69zg93sBIOmk6DSwE2O+R9FRJubDlZDOEo99cg27FbK8qqjtWybvjjYLkDlqfZ7MXZvRpXYLyrQKH+RKHo2PQ0Pdzm5mPs997OEad6Aj1NFj+bQPfludi/gD2Cvmv3uMZbUzb0q+GPCHzjnjzcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3z9vwJe; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3z9vwJe"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso6119a91.1
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427494; x=1786032294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTi6VJL4D2x6nJ6t6S27JxQ0hh8cwm7AwOqGNxZS6p4=;
        b=Y3z9vwJeh9g0oRZO02WVn21HL1O6iTKQteHH2IYnHFGaaUQCzzfo+Nre5fptM+MHN5
         Id+1puc/mQdQqLgS9dAW51HQpP2iLowQkaYawYNxEImfbYrx0Q21q5xd40yp82sV9aeW
         naqwXC3mp6d4HiHUcrr0CRVBVMcYexfzhIsDKvGbR+DE+PjGMCjU599ENhAWQ8XtRr6X
         MrXayb3SQMLULLTxQMVs+23O/AbnLh+1osLIHDw9Ft46yNDgcwNVatPVLmaoMlPVPzO/
         DJsCsoj0GUkA00zSe8yVZfM4qyQTAngO+hQOAb4M2eKHnEnNgzqTFlS6k5ERrod/m6Ut
         4fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427494; x=1786032294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTi6VJL4D2x6nJ6t6S27JxQ0hh8cwm7AwOqGNxZS6p4=;
        b=n97scOsnasM/bxgjOyDz8qz4fQAtD00YvoV9ZEcAU1UA3TxPDd03mYJjIZrwm5JOWW
         Rd6WzfcdU801wD0JBZPZYo/lUPkDYfTULBXOYe4vnWdChZTwk0DFsIKHT4E2SBAr4Dpx
         BRnSOVIAcPJq4YAbNLs4nmMOkWGRysPtOfYNCr+ZlvsMIpeWjnDz3o/B05uLX7Y/uc53
         V4jF19B7iZhQ0Ds58kNQbAqNJ5NYtiRSDyEJN9ittMOJvCkFJY0+KAau9BEY317kS+AG
         Cm2FNgq4NYpRnDBggm4oe6jVr755ZsAfS2LpIME4TkfBPWOIryGeMMfojwnKJapPFbvm
         A31w==
X-Forwarded-Encrypted: i=1; AHgh+RptYCzUBsSW3/Wyhr93OWEPzgnwfJoEG06/F7RhlbqETBC2nPzOYZjKK8scEiIOQNcqaBo6Gbl7E8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx28GSH7pWkH1LhhClzB/GsaTe6JwGyGklkdM6EBfvFUkfij6V
	+Vj/hEFj8IM/NNktsFNcSc0EPa7jsgGjB6BvmfILKiOk+3DWzg9w1/ep
X-Gm-Gg: AR+sD10PYBYjsY9BeEdBF61FuNaFQQ8THvGqzsVCXulnKgGTBsFEH5VkPTB8zc099VG
	rKAQaxECBFVBjeUXiS3hjCli8P2SKQxfmhfPyhUhCnMtZYu6wXprSTcwlC1UjcuoRaHnWOisIOX
	9vx5xcDEQBEV7dBpBEortUgMHUwHA1Sk0cvWAXKptEIYeqxJ2NzjMpTB2f3jdbKWwyM5Qn/1HqK
	yWqY/B/mV6LDC/XdJg8F2fS842sKqcB5No0r/+MgNj1KAsjsEHHJbctXJ+hBUuTv/BmGzxACkYr
	tOW1Q/2HrKYk8JjJ7nAh1EI6g94KvlyF2oh88L5IlySFyCzRxGMNsg/JhOWjeYskqzShGRw/vO2
	3boe0QONDHQNujER5vTAuwY8lUpezcnu99CRVt92FYd2KV+bw4nU8fqUynKb0UL6Ma+KuiT4gFE
	t428anDm2w3JxwzCBPViQdbFBfOIFlwmxhP+YHHaVZa41Hh5hDJR1t8KJ0AQQ+Fg6m8tjaybkqr
	Yk=
X-Received: by 2002:a17:90b:1dcc:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-38fa8041704mr793333a91.3.1785427493649;
        Thu, 30 Jul 2026 09:04:53 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm35012783c88.5.2026.07.30.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:53 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <shivesh@example.com>
Subject: [PATCH 8/8] wifi: brcmsmac: ampdu: clarify standard compliance on QoS change
Date: Thu, 30 Jul 2026 16:03:56 +0000
Message-ID: <20260730160425.11933-8-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730160425.11933-1-shivesh@example.com>
References: <20260730160425.11933-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates XXX comment to properly reference IEEE 802.11n requirements
that all MPDUs in an A-MPDU must share the same TID.

Signed-off-by: Shivesh <shivesh@example.com>
---
 .../net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c  | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5d8..3fd8bdbd35e5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -516,12 +516,11 @@ int brcms_c_ampdu_add_frame(struct brcms_ampdu_session *session,
 			return -ENOSPC;
 
 		/*
-		 * We aren't really out of space if the new frame is of
-		 * a different priority, but we want the same behaviour
-		 * so return -ENOSPC anyway.
-		 *
-		 * XXX: The old AMPDU code did this, but is it really
-		 * necessary?
+		 * IEEE 802.11n standard requires that all MPDUs within an
+		 * A-MPDU belong to the same TID (Traffic Identifier).
+		 * Since priority maps to TID, a different priority means
+		 * we must close the current aggregate and start a new one,
+		 * so we return -ENOSPC here.
 		 */
 		first = skb_peek(&session->skb_list);
 		if (p->priority != first->priority)
-- 
2.53.0

