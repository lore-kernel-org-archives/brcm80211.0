Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA331429D
	for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895449; cv=none; b=cFrakeBQPRPxjvWMDlgkdXvd0u3xizVdNmT/c18zfm/9k+LlksjV+OBTehp7Mr91ESJTWIxe29z8iHgK+Z5lXEd2ZCR/HfHCyoqCt1yKNGtIH60Syteuool25rpeSJ/RmgrTXRoBdHeemYLloModukbnB9nnHY9jaUKeWFgbpQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895449; c=relaxed/simple;
	bh=ER8tP37lObIhQR9iMWULWXKSl19MKFjdA03HNDy5ju0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmOb9n8WE6UkorXoTLDtFun1IxVdRm/dKf5xvg9J5GVbMqW8zJyNqNPvndcVZ69A//+Q6znMTZriD50+Kv0w0HOqNu7mbWpFbLdHTOsP1n2EsbCJOp9ZcvosUTltEgP2ogAXjNd3fRBN4U9tZodC1O+ujdrzW0qgUXmySptbFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RdeZO08B; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RdeZO08B"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-6626b5ace23so5307058d50.0
        for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 15:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895447; x=1784500247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M5Hwfd1WgOYHOQEiKGvpV7zc4NRj0z5awcHqZeRtKQY=;
        b=nft4NzfzqKyYuEFQqqjfjQaUOKg5PeCdUN/8E7Fn151d0ZFIUkYtEK2p2bH2CGvSB6
         1hElyUN+CFBew2/D1in3bPcVBmW+FivxbC9CcZJi5YjgAxz+VwNDDiEISB9CvBAt4fn7
         11apkwvTvYnFQQf1xbRgHvRWTtyqwp1i+dDb1IMc+dhgTBskCq6r/5xWm8xojyga9MgF
         gN1ORKyr7hFdTJ83PRsF5yIDB6j3m83v28vhbv1ttEuQqqrGStLQRExHmSb06itiYQPi
         5qTG1Ree0LIlH0W48meKI5KjgLy84thuAs5+Gi16LDB/7gwcIEJJC7suwfrdYHGMbSXQ
         r+cg==
X-Forwarded-Encrypted: i=1; AHgh+RplW9S16tpVaFfkIbJQm5xh0vPnZRv9im/6sGCzljnwn2J1FxZzwawLKY3BGjhPAxB0DxzZsPjLbro=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAkJ3DIyx/ML5HQjxqIzXgUa7SlZz6E3jDJad1+pinuLXlqwdd
	xuoHMqSAQkvhfYV+9E7atQnnlg+s6286SN+AC5ZF8rnV4MLVdU30Cx0RulOz6++Yv6VcVPKHQuQ
	3E6/F41V/0rsLpxkT8+TBvMHiELrdrBvQkuxDbJzQjl3JA7KtpK3akLXsbHqG9soicRjtr/Yn/7
	KfE8v15SUqy/NLdew3sMXZmoZ2CfYF1HnVwIGq0UQrruLAleyVA/b3dA8gyKZ9e8tUb6yqYjcDe
	VbGqvcq169ksi5cB4AZKw==
X-Gm-Gg: AfdE7ckcPsxtgiDSFZq6iNePJcw/Gnyx6bp2rWpS3Afr5JeFrhy57h6BJ1/o6MGdXMj
	zkQCuIVNaLOM83t+C2C7Q4ljJHdudE3a6OYsq4hjbY+HyhfELgN7A+Pz51tPWh918gVXideSQR9
	SllfzLwEnVbGjZFGJmC+W9pJIxXpUi+acZcXVKJw8gfL+Nluabqzz155GLH89lPQaqe4lZ1De/a
	Fa2nO9l+m9LNA3THNLr88gRO/iBBN+NPWq+mw/3tomCSUG7BmK7oGySrwRKRmxgCHDWzysr/RbL
	4wtU1tfCLk+PgbwtiJNsPn/sjGo+q0IWndrSm4BoYmAT5kZUYYFuAqJwaGVBKEmn6WIUe9gqbzp
	cG4RIJ8KCKA8ZsEK50QvsxvmBssf6iePNd2JESngWpIWzUZloMxq8QKDRIWQCd6D+QyjYT19oMq
	pnugyKMEu4lCyJK0JyIs8rA2lZ8YLQuBaJwXzUwfc2XDYLQ1QPI/N4
X-Received: by 2002:a05:690e:12cf:b0:667:f4c8:1119 with SMTP id 956f58d0204a3-667f4c816c3mr811594d50.2.1783895446705;
        Sun, 12 Jul 2026 15:30:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-66787a3b85dsm879995d50.23.2026.07.12.15.30.46
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jul 2026 15:30:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so2567517a12.0
        for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783895445; x=1784500245; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5Hwfd1WgOYHOQEiKGvpV7zc4NRj0z5awcHqZeRtKQY=;
        b=RdeZO08BoJBArUDk2pYPU6M7LsouCbFaNRhuP48vePmOURfly+jxwnOXJC7vIy+LIc
         VA/dFb4AfC+pBBx9Rsd3GFc6WdI42afSDyxuqcDxSrXwZaDK0KM/cvaiG5f3uCoAJeDi
         920k/brxA8qe7JRMcDXdXXzrnXxJ9NjhHeFFI=
X-Forwarded-Encrypted: i=1; AHgh+RouYzV9vt2GugeN1GRiAMlG1v4X99L4D4StFMr1DrmsaYDRZppyM+tgnO/erLl+hbFbNTne+yz0xnM=@lists.linux.dev
X-Received: by 2002:a05:6a21:164a:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c0f085cddamr12242629637.1.1783895445297;
        Sun, 12 Jul 2026 15:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:164a:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c0f085cddamr12242613637.1.1783895444870;
        Sun, 12 Jul 2026 15:30:44 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm35908753c88.1.2026.07.12.15.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 15:30:43 -0700 (PDT)
Message-ID: <99c2c345-c594-46e1-b48a-de7f6e52e1c6@broadcom.com>
Date: Mon, 13 Jul 2026 00:30:42 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Bogdan Nicolae <bogdan.nicolae@acm.org>
References: <20260709122315.11400-1-bogdan.nicolae@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260709122315.11400-1-bogdan.nicolae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 09/07/2026 14:23, Bogdan Nicolae wrote:
> Avoid setting packet_id to cookie, which is always 0. Instead, use an
> increasing atomic counter. Avoids mismatches of completion events later
> in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id is
> checked.
> 
> Also, zero out auth_status on initialization. Otherwise, garbage will
> leak from the stack to the firmware (when bssid is less than 32 bytes
> and/or when params->pmkid is set). Then, pass the params->pmkid to the
> firmware (without it, the firmware caches a garbage PMKID on successful
> authentication and denies a subsequent association request that includes
> the PMKID).
> 
> Signed-off-by: Bogdan Nicolae <bogdan.nicolae@acm.org>

I always get a bit confused when people use different email addresses to 
send and sign-off patches.
   > ---
>   .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c   | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> index ce09d44fa..cca53ff19 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> @@ -23,6 +23,8 @@
>   #define MGMT_AUTH_FRAME_DWELL_TIME	4000
>   #define MGMT_AUTH_FRAME_WAIT_TIME	(MGMT_AUTH_FRAME_DWELL_TIME + 100)
>   
> +static atomic_t brcmf_cyw_mgmt_tx_id = ATOMIC_INIT(0);
> +
>   static int brcmf_cyw_set_sae_pwd(struct brcmf_if *ifp,
>   				 struct cfg80211_crypto_settings *crypto)
>   {
> @@ -155,7 +157,7 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
>   
>   	memcpy(&mf_params->da[0], &mgmt->da[0], ETH_ALEN);
>   	memcpy(&mf_params->bssid[0], &mgmt->bssid[0], ETH_ALEN);
> -	mf_params->packet_id = cpu_to_le32(*cookie);
> +	mf_params->packet_id = cpu_to_le32(atomic_inc_return(&brcmf_cyw_mgmt_tx_id));

As I understand things the cookie value here is an output parameter. The 
driver should assign it:

+	*cookie = atomic_inc_return(&brcmf_cyw_mgmt_tx_id);
	mf_params->packet_id = cpu_to_le32(*cookie);

>   	memcpy(mf_params->data, &buf[DOT11_MGMT_HDR_LEN],
>   	       le16_to_cpu(mf_params->len));
>
Regards,
Arend
