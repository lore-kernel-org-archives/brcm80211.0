Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974E3A7F41
	for <brcm80211@lists.linux.dev>; Mon,  6 Jul 2026 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364783; cv=none; b=OE4jxL85I2uZbiUnUltn81vOMpOBqGsKhmn9ZvVjTtdDoljZ+FLW7SiJQt3wAKlNdg54F8TMXOvQmelFBUtSy0v7pa8aaS0kYcTLnBJpc4Q0RrRrwy2T/zfd2/NnZmDEUBdB3m82KegoWDXxTzVTVGzhWrEtcqtSVsJ91gmH5yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364783; c=relaxed/simple;
	bh=LrCPJ/QtDYKjWEr9SURf8YATGWYUuKmjnMwYpwXzMCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khjvRdcb5YNN4AWjSXOICWn4cSygW12RupJ6AefxYC9fOHN9q8enANt7UwhWlJN7RIgFnEF+gU+NSyqq7hjTXYGbiumlfdBGoxr7gKkH4jifo3sJMfzYCyDNbS/UEpvQl9PUz08WKbZycrXQpN+lY15msvj6FBZ/fBgO7nns61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=b5J6vdOn; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="b5J6vdOn"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso2455246a91.1
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 12:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783364782; x=1783969582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUr9XqAW3S0CTUcmm68ll/Tep0fc/YKhDOl7KqLiXcE=;
        b=mq/raLpqI0pSt6yP7qvQFQg6IsW8C2kQ5FusNcSFUJekx3LKZ/Phvi8u26m8u9BROp
         hHyuaRz0vHkiWR01GRbqviFgF6oZVkYOdJvzgOCWWd8aADPToG2s/WWz6J3RiuYlc7d0
         tiDFhLHr/MToYB/3r4IacW/bTYs/M/EFJ69mVNlM17IsVj9hVBDQfcGCI3AYNTqOnGwv
         YgLkbppWZMTRHvbolY9hhLiEGfetnE26egQANJewfxfTYpt1HmBfnURb7uStzAYAwgHu
         ef4aLMHa5IgNNBVhxfkoW6l2d5sKXZ0tVZ4uNZPs+qxVMO/WdFXFVjSFnCEgP0DE8xpA
         j46w==
X-Forwarded-Encrypted: i=1; AHgh+RrtPwJH2rVbZa0Kb5FdCGTN7QZAqZ4Tdbp3rrRZhLpa+LobJ6sj+icn6HVrJkw9WpoU3nt80ylUmIU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJUAAKB0RO3svb9W8kaV1GchpgngsUn8bLRn9rEj1XLVkU29HQ
	kEX4EMYq2AsBKC+VPMm6/y3F2ZADso5xucgpNhYy2JC9VTen7a0hUmls+c+6DZ/Wrq510wbgRCx
	HQ3k4hwiSebxsZB6pmdlhyLkXsmC8kiXf5ssjbA8RaTLb6Fe8QlDvSg1BUTGEXkjG8BuMcPTksW
	20Ogw6yeUDsojr4nJ3O1ZUiPv3MWlMdd64MGUdNhovUw+tqjV5jrso11ZKyCKL3wMTtmCxUM8ap
	j+8Ftky+i1x+MFcISRRcg==
X-Gm-Gg: AfdE7ckkk8iy3qopBfObCbXxPRXMpuy5iUlyISQfeXlFRBhxnY9wj6V9S+ZoWYRIihm
	KIzItb4SeQgnXPJXMHKyYT7AGdZDSLmOKaa4hwdlhcgBtVD4M8nwx06kMljAkvUD/FaZ5IY/r4E
	EfOumQnKWNUhFjM+PkcY7L0bMWlP8qt9T4y6ZNMjeUFHoSe9qOrdjMNnCATX9OEDUdyahzbTXk7
	knamSd+WnETCzsCPBDxl1oWA2x0Qv+9RII1+J97vactuf+TDndgCH0ijXRHsOskWM2+ZLTRcPLn
	VGfywtlGxNlevC79f8SXWWvWDSyg4siDBfeFmd1PXuOXjLU64qiJNAfr8NFuwtxwbbTUQapwiGF
	mPvW68MjXmMX8kb+LwesifdRwYzijpRozkp+8AI1O6TOGzN8/8ZVlHWYIFZ5uOU8l1tNvmPQzB8
	OHMZVw2BrCcaKYMwDiIgtg4C8ILU/lq4/G9dU6Dhr3ATxMJJ/xWDym
X-Received: by 2002:a17:90b:39cd:b0:381:85c0:1d88 with SMTP id 98e67ed59e1d1-38755d3edc7mr1981064a91.9.1783364781724;
        Mon, 06 Jul 2026 12:06:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-30f0b5b6949sm826742eec.0.2026.07.06.12.06.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:06:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55721a8cso346570985a.1
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783364780; x=1783969580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUr9XqAW3S0CTUcmm68ll/Tep0fc/YKhDOl7KqLiXcE=;
        b=b5J6vdOnYPgmpkh9M7mXPgUbUW07w/e10mY7pJ3BeVa6dOX43b1IeiIG+MbE/mqt5G
         YZAf4Gt7lNQqL9JxCRpFQ8GS6fhkU0GToLyWFuu5WNGN6Z0z0G7xq5MwEmKa8ljCvmNj
         0q0T+6H42oA81BuF58Jq2atz6cDBfz1+zorGg=
X-Forwarded-Encrypted: i=1; AHgh+Rp5kuBHxu+1fEvG/mXbkI0KOJGub5Tg+0aKkPgv766sunyu0s+Se0j9ffTLj1qN1o1h/0oIsRJ8iDo=@lists.linux.dev
X-Received: by 2002:a05:620a:688a:b0:915:cf88:1e26 with SMTP id af79cd13be357-92ebb5680f7mr255496985a.48.1783364779804;
        Mon, 06 Jul 2026 12:06:19 -0700 (PDT)
X-Received: by 2002:a05:620a:688a:b0:915:cf88:1e26 with SMTP id af79cd13be357-92ebb5680f7mr255489785a.48.1783364779082;
        Mon, 06 Jul 2026 12:06:19 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800efsm964890985a.4.2026.07.06.12.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:06:18 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: cyw: fix heap overflow on a short auth frame
Date: Mon,  6 Jul 2026 21:06:11 +0200
Message-ID: <20260706190612.708609-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260627131313.3878893-1-maoyixie.tju@gmail.com>
References: <20260627131313.3878893-1-maoyixie.tju@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sat, 27 Jun 2026 21:13:13 +0800, Maoyi Xie wrote:
> brcmf_notify_auth_frame_rx() takes the frame length from the firmware
> event and copies the frame body with the management header offset
> subtracted:

[...]

> Reject frames shorter than the management header offset before the copy.
>
> Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
> Link: https://lore.kernel.org/r/178214417708.2368577.16740907093694208834@maoyixie.com
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cyw/core.c   | 6 ++++++
>  1 file changed, 6 insertions(+)

Nit: the Link: tag in the commit message is normally added by the
maintainer at apply time, not by the submitter. Please drop it.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
