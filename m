Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB50E15E97
	for <brcm80211@lists.linux.dev>; Mon, 15 Dec 2025 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765796356; cv=none; b=BfQINHcHau2HVPiEB0D/y6kj+qhzm9YhWJz9Cfimv2JBierCp1KW1mtqW9+3mwclAFiw5gMpK0u1Tkq36WAv5/ThVjCRyrEifmaRQsEjtNvf0/Elnkk7BpZ5Dbg6/cn6dgF0PQcXlK6J37d8MzfU1xOixEiiFiwfQDqUCPLUI+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765796356; c=relaxed/simple;
	bh=WALXRYaSnX2NQo5Zdoa8yuA91lMK6EB0Ik6rvocO8FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0y02DUDW9AT90WmXLzs3diHA42Sv6zZQKIbIhbOHkAINB0D1da/ydF5HSLXKvphI1NRLeS1SBnd+s1/6Vb8T/F7Hi0QPbfQy0wGwngQIGcTzn024OqXHVzfhrLFJsN6gqXEXn7xb4HOjbQz83RJ4atcXp0qWlKmq6hsmEI5kcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IJ/ghF+l; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IJ/ghF+l"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-c026e074373so2939098a12.1
        for <brcm80211@lists.linux.dev>; Mon, 15 Dec 2025 02:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765796354; x=1766401154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGPBtN+GRkztVcF7iYTgvUriQdToelq0IYjOfLdYOeA=;
        b=ADVfoZm+upvGIWe9tqG8ecF9ckZd5wnrDkwq1v1QKAeraXmAWwHZBKTA8ZqMkdJzZX
         8vjUtYf3t9qayRH5mBYJQdGnGuQAsuPE8Gy8R+QcUxQ+TbA8zeBcWiXQTlVTaWuDH0nk
         q6gVhdXH9JLxlnSyHilrLvD64mIFiGNM7b2Kp59BvARn89yZRKHiOcc2hLuuU96rNzBo
         OWkKGlsk4TagHltuu9dbf23wj4j/A+llf/22vaPcwRwKGqm3AusGd15pG/uwatmOixWN
         bcana64qj918WcUESx2HbcwcKm44RS+Scw1Hx4FpFPIbN1mArEZ6AQgqaUyNqo4x3Lcq
         tOdw==
X-Forwarded-Encrypted: i=1; AJvYcCUaIbmsw4yC9n7RTS5brikdu/ZmAP7SQUuxIdnopPyqKqp8QajrTeNQlve7OgT+XkRmcA2V33b8TCo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYMiB7zhqQ+wxa/H+BXDGcvwGYN3FPRWRW1zcD74QLWGBn5yaz
	HaxUWgRsKMW6mi4rr8cA4+InEum9Kujg+tIy67MbRsV1+6hZBuPQdTF9sBR9sIFPSXUT0Kv5b+U
	JCyBeuwLkqPKxXImuapc8+Ksl5wQyUybi6axhU8jxgTiNLgnJEL+9p46BKcEZHUV9do8qgsahWk
	4GvnlIo8k7ZQ/pFTj/CrwJWc8LQR3hL3eaRr+mxrHlqu7ubg6QF15XhwuOsH75UTJk9umIoz8sA
	9/SzQdRkRI9y2K+sZKQcQ==
X-Gm-Gg: AY/fxX6cqmG/nAAzq2rc2J3LTVKC4WhIu161tR63uSqjcKbWLvytpMRaTx+9WO1Vngd
	XgbUS5wZVyahsW4bVbTR0S4O0hU7/AWtXIUNlqWPkw/xhIjEY5Z2Sr0fY8bo0F+JaAogsGt2mj/
	yfpv+w4fVaUXxWFOpkLqKIbuzOAs6Z5OVjBul7pEOkyiXVO2ASGSaVn2GtwrMVcUzVqttQgMY4i
	RnDW/RGXV50RScDzQEGwmUTFcT4MSywkWbCCyogPjGWyaTE2esvf16mJpnsKHwb5diViQAj/R87
	BFqGqD1Ct6rBAv59orHn/SEbQKQW/6TxqxGxaEfZlPFNXHaUKcBylkCOv/d+7NLt2aBF9XehL8F
	n3I9JiuNxBRB+FnMeNvjE2487eZWMXyt+l4QyRvYFlxNDx+yQ+yeR7R0ehYoAZQTY8gqpkVg+Xc
	9eI7jxJk+qoNr9iPXyB/zDXsjqpby7RppuHU7EAOBo6ygq9HD4
X-Google-Smtp-Source: AGHT+IF9s4OKlANKMPp8Ls3mNFpSwIr53KfFuesGg/IcoJmTLC2sbx2tQSk3Bt+wkkEZ9w4mk+6BoXH+Mgrz
X-Received: by 2002:a05:7300:7b16:b0:2a4:3f9c:9af8 with SMTP id 5a478bee46e88-2ac2f870512mr6770062eec.9.1765796353867;
        Mon, 15 Dec 2025 02:59:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2ac3c13d622sm1388780eec.0.2025.12.15.02.59.13
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Dec 2025 02:59:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f177f4d02so54277885ad.2
        for <brcm80211@lists.linux.dev>; Mon, 15 Dec 2025 02:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765796352; x=1766401152; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eGPBtN+GRkztVcF7iYTgvUriQdToelq0IYjOfLdYOeA=;
        b=IJ/ghF+l7eUcy/R5BeD6XIgjKdKX+SLZRkXoYhFtG0bDcWf39XqgLWlgpnd/EB45wL
         XFkmKkr2en53fO87rHbeInIfVO1v1LbsCPsxbAW+jnZtUWi8sCR8HwFYj9NeKsDG+jw4
         /wk/w7KYVRf6+HrQXZ7YHQK/e5VX3OX6vdtMg=
X-Forwarded-Encrypted: i=1; AJvYcCXNxsr/yf35LcbVcZkU+2bmxGGGpyHnHHJxrUApD4CVyVEaKMbaE8CbMi2WXe9Kh7jKWxgBDSxOlKk=@lists.linux.dev
X-Received: by 2002:a05:701b:2513:b0:11b:9386:a3bf with SMTP id a92af1059eb24-11f34c2b670mr6945956c88.42.1765796351990;
        Mon, 15 Dec 2025 02:59:11 -0800 (PST)
X-Received: by 2002:a05:701b:2513:b0:11b:9386:a3bf with SMTP id a92af1059eb24-11f34c2b670mr6945925c88.42.1765796351432;
        Mon, 15 Dec 2025 02:59:11 -0800 (PST)
Received: from [10.176.3.239] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm41349925c88.8.2025.12.15.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 02:59:10 -0800 (PST)
Message-ID: <d0a40ba8-8af4-464a-9879-0d7e3a124a00@broadcom.com>
Date: Mon, 15 Dec 2025 11:59:04 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: rename function that frees vif
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
 Ting-Ying Li <tingying.li@cypress.com>,
 Chi-hsien Lin <chi-hsien.lin@cypress.com>, Ingo Molnar <mingo@kernel.org>,
 Wright Feng <wright.feng@cypress.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Roopni Devanathan <quic_rdevanat@quicinc.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Chung-Hsien Hsu <chung-hsien.hsu@infineon.com>,
 Ian Lin <ian.lin@infineon.com>, Kalle Valo <kvalo@kernel.org>,
 Alex Shumsky <alexthreed@gmail.com>,
 Marcel Hamer <marcel.hamer@windriver.com>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20251215103817.29598-1-zajec5@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20251215103817.29598-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 12/15/2025 11:38 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Since the commit cf124db566e6 ("net: Fix inconsistent teardown and
> release of private netdev state.") netdev isn't freed anymore in the
> brcmf_cfg80211_free_netdev(). Adjust this function name to match what it
> actually does (freeing vif).

Hi Rafał,

Thanks for this cleanup.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++--
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h | 2 +-
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c     | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
