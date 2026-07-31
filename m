Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527943DB336
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501351; cv=none; b=GsKU6Ya0UimHPsD+xxDehDIsOpLmPqYvq5CUobUK3IwS0x695Ieo1phVsGFEU2POUn4/aiq8PrbVqlGDgICrdZnlGC+8EIesOGKbWA/wnYpJ9LbgrKrpIxPYPRFo70/1UNAMK7xjTVotbdDCO9qmWVAkcnIzBouE1TNT7kbFI40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501351; c=relaxed/simple;
	bh=1ukQPGZfnGJpH0PCLbtQgHHHM4pWuS0+vY4qQpidol8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtbSeIFQWj9ShElGaVahLlf1+Qq5oT96xsxRH4six0JQWZaJKzg/jkd3XhUPK1uI+FRy1BRVhyua/sbPRw6RSTio8WyJ4LHUflZUmJSEifRnmQg7cvji/Ydqn1uwMbqFTYQTO9WxjrSU42q7ENb3F03KJDcK9klU0/9DLgLXYIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hcZLn1sq; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hcZLn1sq"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38759bcd877so876792a91.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501350; x=1786106150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OlePq0hG08Pbp6Rj/6MQSCYKEAeScklhwdBNiR+MvA=;
        b=p98ulavjTQJjgwYUuF0MbkM5wzrdWs7gl0rW5ldBdnXwp0E+5eczOm5yqIRxNMlnta
         orHRiAND7I5QzI7qri7b7z+nAK2p/qCH4e03v4e9U6JHxPCgPKv08/FVk0UptsqMqTbh
         F7+/zi72JnmVv9G1vnyMJ5V4i+fYuM9f9zcQG+Vu3H3apNxTuQkuxWgswQxrEF50CM7P
         YUznEiY+DpV9HK31S0i98+DJuRiDLPt3rXlUoNMGserFq8P9GB24iI80ezPGs+WdPVCg
         9WJHj9TyPTyLy4XIrc8KH5tl+FjJrVXgFrvgPyhFJwMS84LJKPrTJbnHgOBbN+fUigN6
         22kA==
X-Forwarded-Encrypted: i=1; AHgh+RrnsI86SRqRVSX92Vn3WSl2p5MbMpKYETqcFJFfdHFlDR3ZuhZMx67kb+KWXq5OM8GHwyD+AFjnXtk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqA15/U4of/VaphCvR1mA9KCz8I0erarmLqY1vdXAuknREL6iR
	GuyPaYex4E7goCmBioxu1RHjGKRiDvt/Dufoe2OmEgeqd2+7wtWFVjkXDmAY8bCe7mAitS6GA3q
	mv+u/Nvfyhue+d0omRXTkgTDUqGWw2LNsMneZCjNtkVQERb841CR2NhV3J8c0LClJaw3On1Ni+M
	L/9cVNyN50+yOkN6sZSd6vohkHL5n4SJ2EfdLMzMsLhtaO7o46C5g1F/GRwRLLy/gt3hP3YIJt5
	hFMsgJDv8FYQUFMo2X/Sg==
X-Gm-Gg: AR+sD10Q0Ren9WUJj0Kv/x9u9M/X6+A2PKKRAxXdzeJcTnSkRwgVKY9ydupT1curRwM
	LdEQB1xe+0M2t7lYUaFPL7sd0k+yd8ZTfeGr/koaLNfugZp+r5pm/SAoOOKBvG472/lc40gYQ6C
	K7PPKOnbEyawrZ0+bZbDB9aGN/Nqg0A83pRPVUCWypCSo1ipkZ6qZ/+8zyO1dFJZ9q7Jc267eTB
	E4Kkjavj2U7FC3/c2fx72JkBGXQ1O6KLswkQ+/rIAR3R7MmDAI+o0gXip9QYXigcNE5/EDT2Ce/
	k4qfF/cSBq4bgJXn3GZ3VRwWbfmMP7uBKmo5N6tT0bl3h2/79+6VdHQs5apnUDk427kXqq9rFfA
	WsHMc9RYpq0ptoh5uLffu32gpmj7qKFfwXOhpVfvj3EqTQ1omcsf/8T84R7KZXvDhPY9y85HJOm
	A1Hc/Nt12YLoZttKFoPLISRfR6xa4DSUKeDi0HJnw=
X-Received: by 2002:a17:90b:53c5:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-38fb13e12e8mr1791959a91.29.1785501349605;
        Fri, 31 Jul 2026 05:35:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-38fb2b67408sm110094a91.7.2026.07.31.05.35.49
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so747581a12.0
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501348; x=1786106148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OlePq0hG08Pbp6Rj/6MQSCYKEAeScklhwdBNiR+MvA=;
        b=hcZLn1sqqN8B2uO6bjhSJqLqVJl6mIhGmGg8u6nAkmEY3MrVE0tJpYg6FO1+cD05G/
         unllWQ4laBdxNjNiIvUcx7VinEJ8nt5z33dtHuurngo80hkUFJUagoWYoJeQcDIXTpMc
         Z3NUlgpVxvSy3Kh6VU9wew7nhcJfOq+mP/m4M=
X-Forwarded-Encrypted: i=1; AHgh+RqnrcRkPWki0n0VHW7ysSNBEUkALgW7qKVVqG+vhDLXNTgD/iUfjAWk93IAJlPl6Xrg6adQQnvn8KA=@lists.linux.dev
X-Received: by 2002:a05:6a21:513:b0:3bf:7eb5:9459 with SMTP id adf61e73a8af0-3c91b0b8a45mr1916999637.20.1785501347516;
        Fri, 31 Jul 2026 05:35:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:513:b0:3bf:7eb5:9459 with SMTP id adf61e73a8af0-3c91b0b8a45mr1916979637.20.1785501347047;
        Fri, 31 Jul 2026 05:35:47 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:46 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 13/13] wifi: nl80211: send frame tx status event only for non-zero cookie
Date: Fri, 31 Jul 2026 14:35:09 +0200
Message-ID: <20260731123509.1975281-14-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
References: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The cookie value assigned by cfg80211_assign_cookie() is guaranteed to be
non-zero. So the zero cookie value has special use in tx_control_port where
userspace can indicate dont_wait_for_ack, ie. not interested in status. The
wil6210 driver also uses the zero cookie when wil_cfg80211_mgmt_tx() is
invoked from debugfs api the driver provides so the event is also redundant
in that scenario.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 net/wireless/nl80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d12bef11b94f..ac895e02cd41 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -22046,6 +22046,10 @@ static void nl80211_frame_tx_status(struct wireless_dev *wdev,
 	struct sk_buff *msg;
 	void *hdr;
 
+	/* userspace not interested in zero-cookie status */
+	if (!status->cookie)
+		return;
+
 	if (command == NL80211_CMD_FRAME_TX_STATUS)
 		trace_cfg80211_mgmt_tx_status(wdev, status->cookie,
 					      status->ack);
-- 
2.54.0

